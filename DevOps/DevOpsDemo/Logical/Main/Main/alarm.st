
ACTION alarm: 
	
	// No alarms only a demo project
	IF NOT hw.di_EstopOK THEN
		em.Command.Abort := TRUE;
	END_IF
	
END_ACTION
