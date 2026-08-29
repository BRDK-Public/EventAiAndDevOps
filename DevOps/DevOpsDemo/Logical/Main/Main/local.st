
PROGRAM _INIT
	
	em.Setup.Name := 'Main';
	gIsSimulation := DiagCpuIsARsim();
	webServiceEnable := TRUE;
	
END_PROGRAM

PROGRAM _CYCLIC
	
	CASE em.ModeID OF
		MODE_PRODUCTION: producing;
		ELSE em.Command.StateComplete := TRUE;
	END_CASE
	
	alarm;
	modules;
	webservice;
	simulation;
	
END_PROGRAM

PROGRAM _EXIT
	webServiceEnable := FALSE;
	webservice;
END_PROGRAM