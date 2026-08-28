
TYPE
	hmi_typ : 	STRUCT 
		startMachine : BOOL;
		stopMachine : BOOL;
		abortMachine : BOOL;
		clearMachine : BOOL;
	END_STRUCT;
	hw_typ : 	STRUCT 
		di_EstopOK : BOOL := TRUE;
	END_STRUCT;
END_TYPE
