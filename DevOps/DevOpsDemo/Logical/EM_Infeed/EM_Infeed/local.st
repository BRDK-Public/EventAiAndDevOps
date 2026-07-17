
PROGRAM _INIT
	
	em.Setup.Name := 'EM_Infeed';
	em.Setup.ParentName := 'Main';

END_PROGRAM

PROGRAM _CYCLIC
	
	CASE em.ModeID OF
		MODE_PRODUCTION: producing;
		ELSE em.Command.StateComplete := TRUE;
	END_CASE
	
	alarm;
	modules;
	
END_PROGRAM

PROGRAM _EXIT
	 
END_PROGRAM