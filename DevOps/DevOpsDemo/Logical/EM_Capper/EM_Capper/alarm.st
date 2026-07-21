
ACTION alarm: 
	
	IF Axis.Error OR simulateAxisError THEN
		em.Command.Abort := TRUE;
	END_IF
	
END_ACTION
