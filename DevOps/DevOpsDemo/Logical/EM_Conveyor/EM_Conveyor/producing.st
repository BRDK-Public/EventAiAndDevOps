ACTION producing:
	
	
	CASE em.StateCurrent OF 	
		
		STATE_STOPPED:
			em.StateInfo := 'in state stopped';
			em.Command.StateComplete := TRUE;
		
		STATE_RESETTING:			
			CASE em.SubState OF
				
				0:
					em.StateInfo := 'Wait for Power on';
					
					Axis.Power := TRUE;
				
					IF Axis.PowerOn THEN
						em.SubState := 10;
					END_IF
				
				10:
					em.StateInfo := 'Wait for homing';
					
					Axis.Home := TRUE;
				
					IF Axis.IsHomed THEN
						Axis.Home := FALSE;
						em.SubState := 20;
					END_IF
				
				20:
					em.Command.StateComplete := TRUE;
				
			END_CASE
			
			
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
					em.StateInfo := 'Waiting for bottle';
					IF hw.di_bottleReady THEN
						em.SubState := 10;
					END_IF
				
				10:
					IF gFillerInterface.status.ready AND gCapperInterface.status.ready THEN
						em.SubState := 20;
					END_IF
					
				20:
					em.StateInfo := 'Index conveyor';
				
					Axis.MoveAdditive := TRUE;
					Parameters.Velocity := 400.0;
					Parameters.Distance := 100.0;
				
					IF Axis.MoveDone THEN
						Axis.MoveAdditive := FALSE;
						em.SubState := 30;
					END_IF
				
				30:
					em.StateInfo := 'Wait for stations to finish';
				
					gFillerInterface.cmd.startStation := TRUE;
					gCapperInterface.cmd.startStation := TRUE;
				
					IF gFillerInterface.status.stationDone AND gCapperInterface.status.stationDone THEN
						gFillerInterface.cmd.startStation := FALSE;
						gCapperInterface.cmd.startStation := FALSE;
						productionCycleCount := productionCycleCount + 1;
						em.SubState := 0;
					END_IF
				
					
					
				
			END_CASE
			em.Command.StateComplete := TRUE;

		STATE_STOPPING,STATE_ABORTING:
			em.StateInfo := 'in state aborting/stopping';
			Axis.Power := FALSE;
			Axis.Home := FALSE;
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