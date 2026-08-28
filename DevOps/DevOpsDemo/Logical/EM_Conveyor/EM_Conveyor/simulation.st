
ACTION simulation: 

	IF gIsSimulation THEN
	
		IF EDGEPOS(sim.produce100Bottles) THEN
			sim.lastCycleCount := productionCycleCount;
		END_IF
		
		IF sim.produce100Bottles THEN
			IF productionCycleCount >= (sim.lastCycleCount+100) THEN
				sim.produce100Bottles := FALSE;
				hw.di_bottleReady := FALSE;
			ELSIF em.SubState = 0 OR em.SubState = 10 THEN
				hw.di_bottleReady := TRUE;
			ELSE
				hw.di_bottleReady := FALSE;
			END_IF
			
		END_IF

		IF EDGEPOS(sim.produce100BottlesWithAxisFault) THEN
			sim.lastCycleCount := productionCycleCount;
			sim.axisFaultInjected := FALSE;
		END_IF

		IF sim.produce100BottlesWithAxisFault THEN
			IF productionCycleCount >= (sim.lastCycleCount+100) THEN
				sim.produce100BottlesWithAxisFault := FALSE;
				hw.di_bottleReady := FALSE;
			ELSE
				IF productionCycleCount >= (sim.lastCycleCount+25) AND NOT sim.axisFaultInjected THEN
					simulateAxisError := TRUE;
					sim.axisFaultInjected := TRUE;
				END_IF

				IF em.SubState = 0 OR em.SubState = 10 THEN
					hw.di_bottleReady := TRUE;
				ELSE
					hw.di_bottleReady := FALSE;
				END_IF
			END_IF
		END_IF
		
	ELSE
		// On real hw just always simulate that a bottle is there. (Only because it is a test machine)
		IF em.StateCurrent = STATE_EXECUTE THEN
			
			IF em.SubState = 0 OR em.SubState = 10 THEN
				hw.di_bottleReady := TRUE;
			ELSE
				hw.di_bottleReady := FALSE;
			END_IF
			
		END_IF
	END_IF
		
END_ACTION
