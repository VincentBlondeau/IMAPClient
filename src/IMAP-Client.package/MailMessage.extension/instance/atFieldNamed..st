*IMAP-Client-model
atFieldNamed: aString
	^ (self fieldNamed: aString ifAbsent: [MIMEHeaderValue new]) mainValue