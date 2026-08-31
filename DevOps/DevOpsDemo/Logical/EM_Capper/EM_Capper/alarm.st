
ACTION alarm: 
	
	IF (*Axis.Error OR*) simulateAxisError THEN // Comment out "real axis error" because it is a test project with no real axis
		em.Command.Abort := TRUE;
	END_IF
	
END_ACTION
