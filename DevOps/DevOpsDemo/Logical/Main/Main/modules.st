
ACTION modules: 
	// Put all control modules here

	em();
	
	CASE em.StateCurrent OF
		STATE_UNDEFINED: hmi.packmlState := 'STATE_UNDEFINED';
		STATE_CLEARING: hmi.packmlState := 'STATE_CLEARING';
		STATE_STOPPED: hmi.packmlState := 'STATE_STOPPED';
		STATE_STARTING: hmi.packmlState := 'STATE_STARTING';
		STATE_IDLE: hmi.packmlState := 'STATE_IDLE';
		STATE_SUSPENDED: hmi.packmlState := 'STATE_SUSPENDED';
		STATE_EXECUTE: hmi.packmlState := 'STATE_EXECUTE';
		STATE_STOPPING: hmi.packmlState := 'STATE_STOPPING';
		STATE_ABORTING: hmi.packmlState := 'STATE_ABORTING';
		STATE_ABORTED: hmi.packmlState := 'STATE_ABORTED';
		STATE_HOLDING: hmi.packmlState := 'STATE_HOLDING';
		STATE_HELD: hmi.packmlState := 'STATE_HELD';
		STATE_UNHOLDING: hmi.packmlState := 'STATE_UNHOLDING';
		STATE_SUSPENDING: hmi.packmlState := 'STATE_SUSPENDING';
		STATE_UNSUSPENDING: hmi.packmlState := 'STATE_UNSUSPENDING';
		STATE_RESETTING: hmi.packmlState := 'STATE_RESETTING';
		STATE_COMPLETING: hmi.packmlState := 'STATE_COMPLETING';
		STATE_COMPLETED: hmi.packmlState := 'STATE_COMPLETED';
		STATE_DEACTIVATING: hmi.packmlState := 'STATE_DEACTIVATING';
		STATE_DEACTIVATED: hmi.packmlState := 'STATE_DEACTIVATED';
		STATE_ACTIVATING: hmi.packmlState := 'STATE_ACTIVATING';
	END_CASE
	
END_ACTION
