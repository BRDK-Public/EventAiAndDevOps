ACTION producing:
	
	
	CASE em.StateCurrent OF 	

		STATE_STOPPING:
			em.StateInfo := 'in state stopping';
			em.Command.StateComplete := TRUE;
		
		STATE_STOPPED:
			em.StateInfo := 'in state stopped';
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
			
			em.Command.StateComplete := TRUE;
		
		STATE_ABORTING:
			em.StateInfo := 'in state aborting';
			em.Command.StateComplete := TRUE;
			
		STATE_ABORTED:
			em.StateInfo := 'in state aborted';
			em.Command.StateComplete := TRUE;
		
		STATE_CLEARING:
			em.StateInfo := 'in state clearing';
			em.Command.StateComplete := TRUE;
		
		ELSE
			em.Command.StateComplete := TRUE;
		
	END_CASE
 
END_ACTION