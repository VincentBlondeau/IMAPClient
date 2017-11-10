accessing
login
	| response |
	client ifNil: [^ self client].
	client port: port.
	response := client login: server user: username password: password.
	response = 'OK' ifFalse: [self error: 'Unable to log into IMAP'].
	self select: 'inbox'