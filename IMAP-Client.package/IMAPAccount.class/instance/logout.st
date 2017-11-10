commands
logout
	| response |
	client ifNil: [ ^ self ].
	response := client logout.
	response = 'OK'
		ifFalse: [ self error: 'Unable to log out of IMAP' ]