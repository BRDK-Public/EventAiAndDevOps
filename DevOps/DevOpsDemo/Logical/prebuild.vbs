' Automation Studio Pre-Build script:
' Usage:
' Add to Build Events in AS ( Menu -> Project -> Change Runtime Versions -> Build Events)
'   cscript "$(AS_PROJECT_PATH)\Logical\prebuild.vbs" "$(AS_PROJECT_PATH)" "$(AS_PROJECT_NAME)" "$(AS_CONFIGURATION)" "$(AS_USER_NAME)"
' optional parameter:
' MAX_SUB_UNITS=X, search through script to change name to e.g. MAX_PRINTING_UNITS
' Will be added as a constant variable in Logical\GlobalGen.var (if needed, change in Function updatemaxSubUnitsInFile)
' 
' Features:
'   - Update build options dependent on ARM/Intel/Simulation target (required for BrdkPackML)
'   - Update git information in Logical\RevInfo\RevInfoGlobal.var
'   - (Optional) Set a MAX_SUB_UNITS in case different configuration have different numbers of a specific unit


Const WshRunning = 0
Const WshFinished = 1
Const WshFailed = 2

' Determin if calls to console(str) should print
If LCase(Right(Wscript.FullName, 11)) = "cscript.exe" Then
    ' Print to console/terminal if script is called using cscript.
    ' If not set, double clicking or calling with wscript.exe will open a popup for each console() call
    ' Furthermore when not using cscript, every runCommand will shortly open/blink a cmd window
    isCScript = True
Else
    isCScript = False
End If

console("Running " + Wscript.ScriptName + "...")

Set WshShell = CreateObject("WScript.Shell")
WshShell.CurrentDirectory = Trim(Replace(WScript.Arguments(0), "/", "\"))
WshShell.CurrentDirectory = WshShell.CurrentDirectory & "\"

Set fso = CreateObject("Scripting.FileSystemObject")

'''''''''''''''''''''''''''''''''''
' Check for git and write RevInfo
'''''''''''''''''''''''''''''''''''

' Set non-git related variables
if Wscript.Arguments.Count > 1 Then
    project = strClean(WScript.Arguments(1))
Else
    project = "unknown project"
End If
if Wscript.Arguments.Count > 2 Then
    buildConfiguration = strClean(WScript.Arguments(2))
Else
    buildConfiguration = "unknown buildConfiguration"
End If
if Wscript.Arguments.Count > 3 Then
    builder = strClean(WScript.Arguments(3))
Else
    builder = "unknown builder"
End If

currentDateTime = Now
buildDate = Right("0" & Year(currentDateTime), 4) & "-" & Right("0" & Month(currentDateTime), 2) & "-" & Right("0" & Day(currentDateTime), 2) _
    & " " & Right("0" & Hour(currentDateTime), 2) & ":" & Right("0" & Minute(currentDateTime), 2) & ":" & Right("0" & Second(currentDateTime), 2)

' Detect if git is installed and if there is a git repo
gitOk = False
gitVersion = runCommand("git -v")
If Left(gitVersion, 5) = "Error" Then
    console("Warning: [prebuild script] git command not found. Install git or update path")
Else
    ' Check if we have a git repo
    ' avoid commands if not, especially 'git diff --shortstat' as it never gets out of WshShellExec.Status = WshRunning
    gitRepoCheck = runCommand("git rev-parse --is-inside-work-tree")
    If gitRepoCheck = "true" Then
        gitOk = True
    Else
        console("Warning: [prebuild script] git repo not detected")
    End If
End If

If gitOk Then
    branchName = runCommand("git branch --show-current")
    tag = runCommand("git describe --tags --abbrev=0")
    revision = runCommand("git describe --always --tags")
    revisionDate = runCommand("git show -s --date=default --pretty=format:%ci")
    revisionAuthor = runCommand("git show -s --pretty=format:%an")
    uncommittedChanges = runCommand("git diff --shortstat")
    commitID = runCommand("git rev-parse --verify HEAD")
Else
    branchName = "unavailable, git command failed"
    tag = "unavailable, git command failed"
    revision = "unavailable, git command failed"
    revisionDate = "unavailable, git command failed"
    revisionAuthor = "unavailable, git command failed"
    uncommittedChanges = "unavailable, git command failed"
    commitID = "unavailable, git command failed"
End If

' create (overwrite) var file (no need to check for contents in existing file, it will always differ due to buildDate)
revInfoFolder = "Logical\RevInfo"
revInfoVarFile = "Logical\RevInfo\RevInfoGlobal.var"
If fso.FolderExists(revInfoFolder) Then
    set file = fso.CreateTextFile(revInfoVarFile, True)
    ' fill with data
    file.WriteLine ("VAR CONSTANT")
    revInfoWriteVar file, "project", 80, project
    revInfoWriteVar file, "buildConfiguration", 80, buildConfiguration
    revInfoWriteVar file, "branchName", 80, branchName
    revInfoWriteVar file, "tag", 80, tag
    revInfoWriteVar file, "revision", 80, revision
    revInfoWriteVar file, "revisionDate", 80, revisionDate
    revInfoWriteVar file, "revisionAuthor", 80, revisionAuthor
    revInfoWriteVar file, "uncommittedChanges", 80, uncommittedChanges
    revInfoWriteVar file, "buildDate", 80, buildDate
    revInfoWriteVar file, "builder", 80, builder
    revInfoWriteVar file, "commitID", 80, commitID
    ' If variables are changed, remember to update revInfo.st in project
    file.WriteLine ("END_VAR")
    file.Close ()
Else
    console("Warning: [prebuild script] Folder '" & revInfoFolder & " not found")
end if

''''''''''''''''''''''''''''''''''''''''
'      Set git tag to ConfigVersion
''''''''''''''''''''''''''''''''''''''''
If buildConfiguration = "" or tag = "" Then
    console("Warning: [prebuild script] Could not write git tag to configuration version")
Else
    ' Regular expression to extract semantic versioning pattern
    Dim re, matches, version
    Set re = New RegExp
    re.Global = True
    re.Pattern = "(\d+\.\d+\.\d+)"
    re.IgnoreCase = True

    Set matches = re.Execute(tag)
    
    If matches.Count > 0 Then
        ' Assuming the first match is the desired version
        version = matches(0).Value
        console("Extracted version: " & version)
        
        ' look for <Parameter ID="ConfigVersion" Value="1.0.1" />
        ' First check if the version is already set correctly
        hwFilePath = "Physical\" & buildConfiguration & "\Hardware.hw"
        currentVersion = getConfigVersionFromHw(fso, hwFilePath)
        
        If currentVersion = version Then
            console("ConfigVersion already set to " & version & ", skipping Hardware.hw update")
        Else
            console("Updating ConfigVersion from '" & currentVersion & "' to '" & version & "'")
            updateConfigVersionInHw fso, hwFilePath, version
        End If
    Else
        console("Warning: [prebuild script] No semantic versioning found in the tag.")
    End If
end if


''''''''''''''''''''
' Set MAX_SUB_UNITS
''''''''''''''''''''
maxSubUnits=8 ' default
setMaxSubUnits=False ' set to True to always set max sub units (will only happen if number is different than existing file)
For i = 0 to Wscript.Arguments.Count-1
    ' search through script arguments for MAX_SUB_UNITS=
    if StrComp(Left(WScript.Arguments(i), 19), "MAX_SUB_UNITS=", vbTextCompare) = 0 then
        maxSubUnits = split(WScript.Arguments(i), "=")(1)
        if isNumeric(maxSubUnits) then
            maxSubUnits = CInt(maxSubUnits)
            setMaxSubUnits=True
        else
            console("Parameter MAX_SUB_UNITS is not a number: " & maxSubUnits & ", defaulting to " + maxSubUnits )
            setMaxSubUnits=True
        end if
    end if
Next
if setMaxSubUnits then
    console("Setting MAX_SUB_UNITS=" & maxSubUnits)
    updatemaxSubUnitsInFile fso, WshShell.CurrentDirectory, maxSubUnits
end if


''''''''''''''''''''
' Helper functions
''''''''''''''''''''
Function revInfoWriteVar(file, varName, strLength, value)
    comment = ""
    If Len(value) >= strLength Then
        If strLength < 3 Then
            str = "Error, strLength set to less than 3 in script"
            strLength = 80
        Else
            comment = " (*Result was limited due to string length, full value: '" & value & "'*)"
            str = Left(value, strLength - 3) & "..."
        End If
    Else
        str = value
    End if
    file.WriteLine("	" & varName & " : STRING[" & strLength & "] := '" & str & "';" & comment)
End Function


Function runCommand(command)
    On Error Resume Next ' on runtime error, continue and handle gracefully
    Set WshShellExec = Nothing
    Set WshShellExec = WshShell.Exec(command)
    On Error GoTo 0

    If WshShellExec Is Nothing Then
        runCommand = "Error: Command: '" & command & "' not found"
    Else
        While WshShellExec.Status = WshRunning
            WScript.Sleep 100
        Wend
        Select Case WshShellExec.Status
            Case WshFinished
                runCommand = strClean(WshShellExec.StdOut.ReadLine)
            Case WshFailed
                runCommand = "Error: " & strClean(WshShellExec.StdErr.ReadLine)
        End Select
    end if
End Function


Function getValueFromXml(filename, namespace, xpath, printWarnings)
    Set xmlDoc = CreateObject("Msxml2.DOMDocument.6.0")

    ' Load XML content from a file
    xmlDoc.load(filename)

    ' Check for errors in the XML document
    If xmlDoc.parseError.errorCode <> 0 Then
        ' don't use printWarnings here as this is actually an error (Using Error in text will stop build in AS)
        console("Warning: [prebuild script] Could not read '" & filename & "': " & xmlDoc.parseError.reason)
        getValueFromXml = ""
        Exit Function
    End If

    ' Set the namespace
    xmlDoc.setProperty "SelectionLanguage", "XPath"
    xmlDoc.setProperty "SelectionNamespaces", "xmlns:x='" & namespace & "'"

    ' Search for the specified XPath
    Set node = xmlDoc.selectSingleNode(xpath)
    If Not node Is Nothing Then
        ' get the text content of the node
        getValueFromXml = node.text
    Else
        if printWarnings Then
            console("Warning: [prebuild script] Node with XPath not found: " & xpath)
        end if
        getValueFromXml = ""
    End If
End Function


Function writeValueToXml(filename, namespace, xpath, attributeName, attributeValue)
    ' Create or load the XML document
    Set xmlDoc = CreateObject("Msxml2.DOMDocument.6.0")
    xmlDoc.preserveWhiteSpace = True
    xmlDoc.load(filename)
    

    ' Check for errors in the XML document
    If xmlDoc.parseError.errorCode <> 0 Then
        console("Warning: [prebuild script] Could not read '" & filename & "': " & xmlDoc.parseError.reason)
        Exit Function
    End If

    ' Set the namespace
    xmlDoc.setProperty "SelectionLanguage", "XPath"
    xmlDoc.setProperty "SelectionNamespaces", "xmlns:x='" & namespace & "'"

    ' Search for the specified XPath
    Set node = xmlDoc.selectSingleNode(xpath)
    If Not node Is Nothing Then
        ' Check if the attribute exists
        Set attribute = node.attributes.getNamedItem(attributeName)
        If Not attribute Is Nothing Then
            attribute.value = attributeValue
        Else
            Set newAttribute = xmlDoc.createAttribute(attributeName)
            newAttribute.value = attributeValue
            node.attributes.setNamedItem(newAttribute)
        End If

        xmlDoc.save filename
    Else
        console("Warning: [prebuild script] Node with XPath not found: " & xpath)
    End If
End Function

Function strClean(strtoclean)
    ' remove ' from string
    outputStr = Replace(strtoclean, "'", "")
    ' trim
    outputStr = Trim(outputStr)
    strClean = outputStr
End Function

Function updateConfigVersionInHw(fso, hwFilePath, version)
    updateConfigVersionInHw = False
    If Not fso.FileExists(hwFilePath) Then
        Exit Function
    End If

    Set xmlDoc = CreateObject("Msxml2.DOMDocument.6.0")
    xmlDoc.async = False
    xmlDoc.preserveWhiteSpace = True
    xmlDoc.load(hwFilePath)

    If xmlDoc.parseError.errorCode <> 0 Then
        console("Warning: [prebuild script] Could not read '" & hwFilePath & "': " & xmlDoc.parseError.reason)
        Exit Function
    End If

    xmlDoc.setProperty "SelectionLanguage", "XPath"
    xmlDoc.setProperty "SelectionNamespaces", "xmlns:x='http://br-automation.co.at/AS/Hardware'"

    Set moduleNode = xmlDoc.selectSingleNode("//x:Module[x:Parameter[@ID='ConfigurationID']]")
    If moduleNode Is Nothing Then
        Set moduleNode = xmlDoc.selectSingleNode("//x:Module")
    End If

    If Not moduleNode Is Nothing Then
        Set paramNodes = moduleNode.selectNodes("x:Parameter[@ID='ConfigVersion']")
        If paramNodes.length > 0 Then
            paramNodes.item(0).setAttribute "Value", version
        Else
            Set newParam = xmlDoc.createNode(1, "Parameter", "http://br-automation.co.at/AS/Hardware")
            newParam.setAttribute "ID", "ConfigVersion"
            newParam.setAttribute "Value", version
            moduleNode.appendChild newParam
        End If

        xmlDoc.save hwFilePath
        updateConfigVersionInHw = True
    End If
End Function

Function getConfigVersionFromHw(fso, hwFilePath)
    ' Extract current ConfigVersion value from Hardware.hw file
    getConfigVersionFromHw = ""
    If Not fso.FileExists(hwFilePath) Then
        Exit Function
    End If
    
    Set file = fso.OpenTextFile(hwFilePath, 1)
    Do Until file.AtEndOfStream
        line = file.Readline
        pos = InStr(line, "ConfigVersion")
        If pos <> 0 Then
            ' Extract value from: <Parameter ID="ConfigVersion" Value="x.x.x" />
            valuePos = InStr(line, "Value=""")
            If valuePos <> 0 Then
                startPos = valuePos + 7  ' Length of 'Value="'
                endPos = InStr(startPos, line, """")
                If endPos > startPos Then
                    getConfigVersionFromHw = Mid(line, startPos, endPos - startPos)
                End If
            End If
            Exit Do
        End If
    Loop
    file.Close()
End Function

' Start with 'Error:' or 'Warning:' to catch them as such in AS (Error will stop build in AS)
Function console(str)
    If isCScript Then
        WScript.Echo(str & vbCrLf)
    End If
End Function

Function updatemaxSubUnitsInFile(fso, currentDirectory, maxSubUnits)
    ' create new var file, only as temp (checks later if overwrite is necessary)
    set b = fso.CreateTextFile (currentDirectory & "\Logical\GlobalGen1.var", True)
    ' fill with data
    b.WriteLine ("VAR CONSTANT")
    b.WriteLine ("	MAX_SUB_UNITS : USINT := " & maxSubUnits & "; (*Set MAX_SUB_UNITS=xx as parameter in Configuration properties -> Build Events -> Pre-Build*)")
    b.WriteLine ("END_VAR")
    b.Close ()
    
    moveFileIfDiff fso, "Logical\GlobalGen1.var", "Logical\GlobalGen.var"
End Function

Function moveFileIfDiff(fso, srcFile, destFile)
    ' only write to real file if contents is different
    if fso.FileExists (destFile) then
        if fileDiff(srcFile, destFile) then
            fso.CopyFile srcFile, destFile, True
        end if
    else
        fso.CopyFile srcFile, destFile, True
    end if
    'delete temp file
    fso.DeleteFile srcFile
End Function

Function fileDiff(f1, f2)
  cmd = "%COMSPEC% /c fc /b " & Chr(34) & f1 & Chr(34) & " " & Chr(34) & f2 & Chr(34)
  fileDiff = CBool(CreateObject("WScript.Shell").Run(cmd, 0, True))
End Function
