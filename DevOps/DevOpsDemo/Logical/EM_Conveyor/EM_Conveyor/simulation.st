
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
		
	END_IF
		
END_ACTION
