accessing
logout
	| response |
	client ifNil: [ ^ self client ].
	response := client logout.
	response = 'OK'
		ifFalse: [ self error: 'Unable to log out of IMAP' ]