*IMAP-Client-model
cleanMessageFromAddr: fromString toAddr: toString
	((self hasFieldNamed: 'date') not or: [(self atFieldNamed: 'date') size < 15])
		ifTrue: [self atFieldNamed: 'date' put: self dateToday].
	(self hasFieldNamed: 'from')
		ifFalse: [self atFieldNamed: 'from' put: fromString].
	(self hasFieldNamed: 'to')
		ifFalse: [self atFieldNamed: 'to' put: toString].
	(self hasFieldNamed: 'message-id')
		ifFalse: [self atFieldNamed: 'Message-id' put: self nextMessageId].
	(self hasFieldNamed: 'x-thread-id')
		ifFalse: [self atFieldNamed: 'Thread-index' put: self nextMessageId].
	(self hasFieldNamed: 'subject')
		ifFalse: [self atFieldNamed: 'subject' put: 'No subject ', (self atFieldNamed: 'message-id')].
	self regenerateText