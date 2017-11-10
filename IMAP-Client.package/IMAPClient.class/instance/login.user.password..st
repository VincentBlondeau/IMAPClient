commands
login: hostString user: userString password: passwdString
	| serverIP |
	serverIP := (hostString at: 1) isDigit
		ifTrue: [MyIP stringToBytes: hostString]
		ifFalse: [NetNameResolver addressForName: hostString timeout: 20].

	self openOnHost: serverIP port: self port.
	^ self sendCommand: 'login ', userString, ' ', passwdString