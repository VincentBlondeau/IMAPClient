commands
login: hostString user: userString password: passwdString
	| serverIP response |
	serverIP := (hostString at: 1) isDigit
		ifTrue: [MyIP stringToBytes: hostString]
		ifFalse: [NetNameResolver addressForName: hostString timeout: 20].

	self openOnHost: serverIP port: self port.
	response := self sendCommand: 'login ', userString, ' ', passwdString.
	response = 'OK'
		ifFalse: [ self error: 'Unable to log into IMAP' ].