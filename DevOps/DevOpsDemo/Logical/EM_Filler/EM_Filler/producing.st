ACTION producing:
	
	
	CASE em.StateCurrent OF 	
		
		STATE_STOPPED:
			em.StateInfo := 'in state stopped';
			em.Command.StateComplete := TRUE;
		
		STATE_RESETTING:
			gFillerInterface.status.ready := FALSE;
			em.Command.StateComplete := TRUE;
			
		STATE_IDLE:
			em.StateInfo := 'in state idle';
			em.Command.Start := TRUE;		
			em.Command.StateComplete := TRUE;
			
		STATE_STARTING:
			em.StateInfo := 'in state starting';	
			em.Command.StateComplete := TRUE;
			
		STATE_EXECUTE:
			
			
			CASE em.SubState OF
				
				0:
					em.StateInfo := 'Ready. Waiting for command';
					
					IF gFillerInterface.cmd.startStation THEN
						TON_0.IN := FALSE;
						TON_0();
						em.SubState := 10;
					END_IF
					gFillerInterface.status.ready := em.SubState=0;
						
				10:
					em.StateInfo := 'Filling bottle';
				
					hw.do_fillBottle := TRUE;
				
					TON_0.IN := TRUE;
					TON_0.PT := T#250ms;
					TON_0();
				
					IF TON_0.Q THEN
						hw.do_fillBottle := FALSE;
						gFillerInterface.status.stationDone := TRUE;
						em.SubState := 20;
					END_IF
				
				20:
					em.StateInfo := 'Wait for command to be false';
					
					IF NOT gFillerInterface.cmd.startStation THEN
						gFillerInterface.status.stationDone := FALSE;
						em.SubState := 0;
					END_IF
				
			END_CASE
			
			em.Command.StateComplete := TRUE;
		
		STATE_STOPPING,STATE_ABORTING:
			em.StateInfo := 'in state aborting/stopping';
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