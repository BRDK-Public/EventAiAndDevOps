
PROGRAM _INIT
	(* Copy files to UserPartition. Only needed due to temp bug in as-cli that don't transfer userfiles correctly *)
	 
END_PROGRAM

PROGRAM _CYCLIC
	
	CASE state OF
		
		0:
			// Create "update" directory if it doesnt exist
			DirCreate_0.enable := TRUE;
			DirCreate_0.pDevice := ADR('USER');
			DirCreate_0.pName := ADR('update');
			DirCreate_0();
			
			IF DirCreate_0.status = ERR_OK OR DirCreate_0.status = fiERR_DIR_ALREADY_EXIST THEN
				DirCreate_0.enable := FALSE;
				DirCreate_0();
				state := 10;
			ELSIF DirCreate_0.status <> ERR_FUB_BUSY THEN
				state := 222;
			END_IF
		
		10:
			DirCopy_0.enable := TRUE;
			DirCopy_0.pSrcDev := ADR('SYSTEM');
			DirCopy_0.pSrcDir := ADR('ADDONS/DATA/IAT_Data/wwwRoot/BRVisu/Media/web');
			DirCopy_0.pDestDev := ADR('USER');
			DirCopy_0.pDestDir := ADR('web');
			DirCopy_0.option := fiOVERWRITE;
			DirCopy_0();
			
			IF DirCopy_0.status = ERR_OK THEN
				DirCopy_0.enable := FALSE;
				DirCopy_0();
				state := 20;
			ELSIF DirCopy_0.status <> ERR_FUB_BUSY THEN
				state := 222;
			END_IF
			
		
	END_CASE
	 
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

