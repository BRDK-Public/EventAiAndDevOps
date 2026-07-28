
PROGRAM _INIT
	
	em.Setup.Name := 'Main';
	gIsSimulation := DiagCpuIsARsim();
	hw.di_EstopOK := gIsSimulation;
	
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