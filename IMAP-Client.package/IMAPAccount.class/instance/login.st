private protocol
login
	self client port: self port.
	self client login: self server user: self username password: self password.
	self select: 'inbox'