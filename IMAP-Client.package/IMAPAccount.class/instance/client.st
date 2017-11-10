accessing
client
	(client isNil or: [client isConnected not]) ifTrue:
		[client := IMAPClient new.
		self login].
	^ client