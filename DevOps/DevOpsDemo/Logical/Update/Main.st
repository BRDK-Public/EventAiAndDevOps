
PROGRAM _INIT
	
	paramsDevlink := '/SIP=192.168.1.196 /PROTOCOL=ftp /USER=update /PASSWORD=update';
	 
END_PROGRAM

PROGRAM _CYCLIC

	
	CASE state OF
		
		0:
			DevLink_0.enable := TRUE;
			DevLink_0.pDevice := ADR('UPDATE');
			DevLink_0.pParam := ADR(paramsDevlink);
			DevLink_0();
		
			IF DevLink_0.status = ERR_OK THEN
				DevLink_0.enable := FALSE;
				DevLink_0();
				state := 10;
			ELSIF DevLink_0.status <> ERR_FUB_BUSY THEN
				state := 222;
			END_IF
			
		10:
			MpBackupCore_0.Enable := TRUE;
		
		222:
			// Unkown error that should be handled
		
	END_CASE
	
	MpBackupCore_0.MpLink := ADR(gBackupCore);
	MpBackupCore_0.DeviceName := ADR('UPDATE');
	MpBackupCore_0.Name := ADR(MpBackupCore_0.Info.Automatic.Update.Name);
	MpBackupCore_0();
	 
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

