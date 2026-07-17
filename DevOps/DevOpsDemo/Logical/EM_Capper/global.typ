
TYPE
	gCapperInterface_typ : 	STRUCT 
		cmd : gConveyorInterface_cmd_typ;
		status : gConveyorInterface_status_typ;
	END_STRUCT;
	gCapperInterface_cmd_typ : 	STRUCT 
		startStation : BOOL;
	END_STRUCT;
	gCapperInterface_status_typ : 	STRUCT 
		stationDone : BOOL;
		ready : BOOL;
	END_STRUCT;
END_TYPE
