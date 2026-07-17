
TYPE
	gFillerInterface_typ : 	STRUCT 
		cmd : gFillerInterface_cmd_typ;
		status : gFillerInterface_status_typ;
	END_STRUCT;
	gFillerInterface_cmd_typ : 	STRUCT 
		startStation : BOOL;
	END_STRUCT;
	gFillerInterface_status_typ : 	STRUCT 
		stationDone : BOOL;
		ready : BOOL;
	END_STRUCT;
END_TYPE
