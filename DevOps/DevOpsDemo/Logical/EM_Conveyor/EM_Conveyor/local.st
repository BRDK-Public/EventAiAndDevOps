
PROGRAM _INIT
	
	em.Setup.Name := 'EM_Infeed';
	em.Setup.ParentName := 'Main';
	
	Parameters.Acceleration := 5000;
	Parameters.Deceleration := 5000;

END_PROGRAM

PROGRAM _CYCLIC
	
	CASE em.ModeID OF
		MODE_PRODUCTION: producing;
		ELSE em.Command.StateComplete := TRUE;
	END_CASE
	
	alarm;
	modules;
	simulation;
	
END_PROGRAM

PROGRAM _EXIT
	 
END_PROGRAM