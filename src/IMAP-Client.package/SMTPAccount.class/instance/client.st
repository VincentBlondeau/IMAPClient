mail
client
	client ifNil:
		[client := SMTPClient openOnHostNamed: server port: self port.
		username ifNotNil:
			[client
				user: username;
				password: password;
				login]].
	client ensureConnection.
	^ client