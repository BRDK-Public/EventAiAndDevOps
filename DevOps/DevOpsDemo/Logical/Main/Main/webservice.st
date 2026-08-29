ACTION webservice:
	webServiceSend := FALSE;

	IF webServiceEnable AND (hmiHttpService.phase = httpPHASE_RECEIVED) THEN
		IF hmiHttpService.method = httpMETHOD_GET THEN
			IF hmi.conveyorRunning THEN
				webResponseData := '{"running":true}';
			ELSE
				webResponseData := '{"running":false}';
			END_IF;
			webResponseHeader.status := '200 OK';
		ELSE
			webResponseData := '{"running":false}';
			webResponseHeader.status := '405 Method Not Allowed';
			webResponseHeader.userLine[0].name := 'Allow';
			webResponseHeader.userLine[0].value := 'GET';
		END_IF;

		webResponseDataLen := LEN(webResponseData);
		webResponseHeader.protocol := 'HTTP/1.1';
		webResponseHeader.contentType := 'application/json';
		webResponseHeader.contentLength := webResponseDataLen;
		webResponseHeader.connection := 'Close';
		webResponseHeader.userLine[1].name := 'Cache-Control';
		webResponseHeader.userLine[1].value := 'no-store';
		webServiceSend := TRUE;
	END_IF;

	hmiHttpService(
		enable := webServiceEnable,
		send := webServiceSend,
		abort := FALSE,
		option := httpOPTION_HTTP_11 + httpOPTION_SERVICE_TYPE_NAME,
		pServiceName := ADR(webServiceName),
		pUri := 0,
		uriSize := 0,
		pRequestHeader := 0,
		pRequestData := 0,
		requestDataSize := 0,
		pResponseHeader := ADR(webResponseHeader),
		pResponseData := ADR(webResponseData),
		responseDataLen := webResponseDataLen,
		pStatistics := 0,
		pStruct := 0
	);
END_ACTION