
PROGRAM _INIT
	
	paramsDevlink := '/SIP=192.168.1.196 /PROTOCOL=ftp /USER=update /PASSWORD=update';
	deviceUpdateServer := 'UPDATE';
	deviceLocal := 'UPDATELOCAL';
	
	ArProjectGetInfo_0.Execute := TRUE;
	ArProjectGetInfo_0();
	WHILE NOT ArProjectGetInfo_0.Done DO
		ArProjectGetInfo_0();
	END_WHILE
	
END_PROGRAM

PROGRAM _CYCLIC

	
	CASE state OF
		
		0:
			DevLink_0.enable := TRUE;
			DevLink_0.pDevice := ADR(deviceUpdateServer);
			DevLink_0.pParam := ADR(paramsDevlink);
			DevLink_0();
		
			IF DevLink_0.status = ERR_OK OR DevLink_0.status = fiERR_DEVICE_ALREADY_EXIST THEN
				DevLink_0.enable := FALSE;
				DevLink_0();
				state := 10;
			ELSIF DevLink_0.status <> ERR_FUB_BUSY THEN
				state := 222;
			END_IF
			
		10:
			TON_0.IN := TRUE;
			TON_0.PT  := T#3s;
			TON_0();
			
			IF TON_0.Q THEN
				TON_0.IN := FALSE;
				TON_0();
				state := 20;
			ELSIF UpdateSoftware THEN
				UpdateSoftware := FALSE;
				
				IF UpdateReady THEN
					state := 50;
				END_IF
			END_IF
			
		20:
			ArProjectGetPackageInfo_0.Execute := TRUE;
			
			IF ArProjectGetPackageInfo_0.Done THEN
				ArProjectGetPackageInfo_0.Execute := FALSE;
				// If update on server is different from the version on PLC
				IF ArProjectGetPackageInfo_0.ConfigurationVersion <> ArProjectGetInfo_0.ConfigurationVersion THEN
					UpdateVersion := ArProjectGetPackageInfo_0.ConfigurationVersion;
					state := 30;
				ELSE
					state := 10;
				END_IF
				
			ELSIF ArProjectGetPackageInfo_0.Error THEN
				ArProjectGetPackageInfo_0.Execute := FALSE;
				state := 10;
			END_IF
			
		30:
			// Download update (directory)
			DirCopy_0.enable := TRUE;
			DirCopy_0.pDestDev := ADR(deviceLocal);
			DirCopy_0.pDestDir := ADR('Default_X20CPx68x');
			DirCopy_0.pSrcDev := ADR(deviceUpdateServer);
			DirCopy_0.pSrcDir := ADR('Default_X20CPx68x');
			DirCopy_0.option := fiOVERWRITE;
			DirCopy_0();
			
			IF DirCopy_0.status = ERR_OK THEN
				DirCopy_0.enable := FALSE;
				DirCopy_0();
				state := 40;
			ELSIF DirCopy_0.status <> ERR_FUB_BUSY THEN
				state := 222;
			END_IF
			
		40:
			// Download update (file) arnbcfg.xml
			FileCopy_0.enable := TRUE;
			FileCopy_0.pDestDev := ADR(deviceLocal);
			FileCopy_0.pDest := ADR('arnbcfg.xml');
			FileCopy_0.pSrcDev := ADR(deviceUpdateServer);
			FileCopy_0.pSrc := ADR('arnbcfg.xml');
			FileCopy_0.option := fiOVERWRITE;
			FileCopy_0();
			
			IF FileCopy_0.status = ERR_OK THEN
				FileCopy_0.enable := FALSE;
				FileCopy_0();
				UpdateReady := TRUE;
				state := 10;
			ELSIF FileCopy_0.status <> ERR_FUB_BUSY THEN
				state := 222;
			END_IF
			
		50:
			// Update
			ArProjectInstallPackage_0.Execute := TRUE;
			ArProjectInstallPackage_0.DeviceName := deviceLocal;
			ArProjectInstallPackage_0.FilePath := 'Default_X20CPx68x/pipconfig.xml';
			ArProjectInstallPackage_0();
			
			IF ArProjectInstallPackage_0.Done THEN
				ArProjectInstallPackage_0.Execute := FALSE;
				state := 60;
			ELSIF ArProjectInstallPackage_0.Error THEN
				ArProjectInstallPackage_0.Execute := FALSE;
				state := 222;
			END_IF
			
		60:
			// After an update we expect reboot of machine so go here
		
		222:
			// Unkown error that should be handled
		
	END_CASE
	
	ArProjectGetPackageInfo_0.DeviceName := deviceUpdateServer;
	ArProjectGetPackageInfo_0.FilePath := 'Default_X20CPx68x/pipconfig.xml';
	ArProjectGetPackageInfo_0();
	
	
	
	 
END_PROGRAM

PROGRAM _EXIT

	 
END_PROGRAM

