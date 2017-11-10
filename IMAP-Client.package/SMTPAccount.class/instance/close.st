mail
close
	(client notNil and: [client isConnected]) ifTrue:
		[client quit.
		client close].
	client := nil