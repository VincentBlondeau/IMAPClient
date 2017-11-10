commands
remove: aStringNumberOrCollection
	^ self forMessages: aStringNumberOrCollection addFlags: #('\Deleted')