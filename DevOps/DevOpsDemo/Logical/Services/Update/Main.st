
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
			
		
		222:
		// Unkown error that should be handled
		
	END_CASE
	
	ArProjectGetPackageInfo_0.DeviceName := device;
	ArProjectGetPackageInfo_0.FilePath := 'Default_X20CP04xx/pipconfig.xml';
	ArProjectGetPackageInfo_0();
	
	ArProjectInstallPackage_0.DeviceName := device;
	ArProjectInstallPackage_0.FilePath := 'Default_X20CP04xx/pipconfig.xml';
	ArProjectInstallPackage_0();
	
	 
END_PROGRAM

PROGRAM _EXIT

	 
END_PROGRAM

