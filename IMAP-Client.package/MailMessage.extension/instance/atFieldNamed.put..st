*IMAP-Client-model
atFieldNamed: nameString put: valueString
	fields at: nameString asLowercase put:
		{(MIMEHeaderValue forField: nameString fromString: valueString)}
