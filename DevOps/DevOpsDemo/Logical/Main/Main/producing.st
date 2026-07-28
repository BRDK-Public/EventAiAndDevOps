ACTION producing:
	
	
	CASE em.StateCurrent OF 	

		STATE_STOPPING:
			em.StateInfo := 'in state stopping';
			em.Command.StateComplete := TRUE;
		
		STATE_STOPPED:
			em.StateInfo := 'in state stopped';
			
			IF hmi.startMachine THEN
				hmi.startMachine := FALSE;
				em.Command.Reset := TRUE;
			END_IF
			em.Command.StateComplete := TRUE;
		
		STATE_RESETTING:			
			em.Command.StateComplete := TRUE;
			
		STATE_IDLE:
			em.StateInfo := 'in state idle';
			em.Command.Start := TRUE;		
			em.Command.StateComplete := TRUE;
			
		STATE_STARTING:
			em.StateInfo := 'in state starting';	
			em.Command.StateComplete := TRUE;
			
		STATE_EXECUTE:
			em.StateInfo := 'in state execute';
			
			IF hmi.stopMachine THEN
				hmi.stopMachine := FALSE;
				em.Command.Stop := TRUE;
			END_IF
			em.Command.StateComplete := TRUE;
		
		STATE_ABORTING:
			em.StateInfo := 'in state aborting';
			em.Command.StateComplete := TRUE;
			
		STATE_ABORTED:
			em.StateInfo := 'in state aborted';
			
			IF hmi.clearMachine THEN
				hmi.clearMachine := FALSE;
				em.Command.Clear := hw.di_EstopOK;
			END_IF
			em.Command.StateComplete := TRUE;
		
		STATE_CLEARING:
			em.StateInfo := 'in state clearing';
			em.Command.StateComplete := TRUE;
		
		ELSE
			em.Command.StateComplete := TRUE;
		
	END_CASE
 
	IF hmi.abortMachine THEN
		hmi.abortMachine := FALSE;
		em.Command.Abort := TRUE;
	END_IF
	
END_ACTION