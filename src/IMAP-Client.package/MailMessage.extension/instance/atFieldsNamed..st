*IMAP-Client-model
atFieldsNamed: aString
	^ (self fieldsNamed: aString ifAbsent: [{MIMEHeaderValue new}]) collect: [:ea | ea mainValue]