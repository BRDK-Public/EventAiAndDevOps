
PROGRAM _INIT
	
	paramsDevlink := '/SIP=192.168.1.196 /PROTOCOL=ftp /USER=update /PASSWORD=update';
	device := 'UPDATE';
	
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
			DevLink_0.pDevice := ADR(device);
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
			TON_0.PT  := T#2s;
			TON_0();
			
			IF TON_0.Q THEN
				TON_0.IN := FALSE;
				TON_0();
				state := 20;
			ELSIF UpdateSoftware THEN
				UpdateSoftware := FALSE;
				
				IF UpdateReady THEN
					state := 30;
				END_IF
			END_IF
			
		20:
			ArProjectGetPackageInfo_0.Execute := TRUE;
			
			IF ArProjectGetPackageInfo_0.Done THEN
				ArProjectGetPackageInfo_0.Execute := FALSE;
				// If update on server is different from the version on PLC
				IF ArProjectGetPackageInfo_0.ConfigurationVersion <> ArProjectGetInfo_0.ConfigurationVersion THEN
					UpdateReady := TRUE;
					UpdateVersion := ArProjectGetPackageInfo_0.ConfigurationVersion;
					state := 10;
				ELSE
					UpdateReady := FALSE;
					state := 10;
				END_IF
				
			ELSIF ArProjectGetPackageInfo_0.Error THEN
				ArProjectGetPackageInfo_0.Execute := FALSE;
				UpdateReady := FALSE;
				state := 10;
			END_IF
			
		30:
			// Update
			ArProjectInstallPackage_0.Execute := TRUE;
			
			IF ArProjectInstallPackage_0.Done THEN
				ArProjectInstallPackage_0.Execute := FALSE;
				state := 10;
			ELSIF ArProjectInstallPackage_0.Error THEN
				ArProjectInstallPackage_0.Execute := FALSE;
				state := 10;
			END_IF
		
		222:
		// Unkown error that should be handled
		
	END_CASE
	
	ArProjectGetPackageInfo_0.DeviceName := device;
	ArProjectGetPackageInfo_0.FilePath := 'Default_X20CPx68x/pipconfig.xml';
	ArProjectGetPackageInfo_0();
	
	ArProjectInstallPackage_0.DeviceName := device;
	ArProjectInstallPackage_0.FilePath := 'Default_X20CPx68x/pipconfig.xml';
	ArProjectInstallPackage_0();
	
	 
END_PROGRAM

PROGRAM _EXIT

	 
END_PROGRAM

