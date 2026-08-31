
ACTION modules: 
	// Put all control modules here

	em();
	machineExecute := (em.StateCurrent = STATE_EXECUTE);
	
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

	IF machineExecute THEN
		httpStateResponse := '{"execute":true}';
		httpStateResponseLength := 16;
	ELSE
		httpStateResponse := '{"execute":false}';
		httpStateResponseLength := 17;
	END_IF

	httpStateResponseHeader.protocol := 'HTTP/1.1';
	httpStateResponseHeader.status := '200 OK';
	httpStateResponseHeader.contentType := 'application/json';
	httpStateResponseHeader.contentLength := httpStateResponseLength;
	httpStateResponseHeader.connection := 'Close';
	httpStateResponseHeader.userLine[0].name := 'Access-Control-Allow-Origin';
	httpStateResponseHeader.userLine[0].value := '*';
	httpStateResponseHeader.userLine[1].name := 'Cache-Control';
	httpStateResponseHeader.userLine[1].value := 'no-store';

	httpStateService.enable := TRUE;
	httpStateService.abort := FALSE;
	httpStateService.send := FALSE;
	httpStateService.option := httpOPTION_HTTP_11 OR httpOPTION_SERVICE_TYPE_NAME;
	httpStateService.pServiceName := ADR(httpStateServiceName);
	httpStateService.pResponseHeader := ADR(httpStateResponseHeader);
	httpStateService.pResponseData := ADR(httpStateResponse);
	httpStateService.responseDataLen := httpStateResponseLength;

	IF httpStateService.phase = httpPHASE_RECEIVED THEN
		httpStateService.send := TRUE;
	END_IF

	httpStateService();
	
	IF Reboot THEN
		Reboot := FALSE;
		SYSreset(1,SYSLIB_WARMSTART);
	END_IF
	
END_ACTION
