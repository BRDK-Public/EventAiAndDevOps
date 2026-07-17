
ACTION modules: 
	// Put all control modules here

	Axis.Enable := TRUE;
	Axis.MpLink := ADR(gAxis_Capper);
	Axis.Parameters := ADR(Parameters);
	Axis();
	
	em();
	
END_ACTION
