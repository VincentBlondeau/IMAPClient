mail
cleanMail: aMailMessageOrString from: fromString to: toStringOrCollection
	| msg from to |
	msg := (aMailMessageOrString isKindOf: MailMessage)
		ifTrue: [aMailMessageOrString]
		ifFalse:
			[((aMailMessageOrString includesSubString: String cr, String cr) or: [aMailMessageOrString includesSubString: String crlf, String crlf])
				ifTrue: [MailMessage from: aMailMessageOrString]
				ifFalse: [MailMessage from: String cr, aMailMessageOrString]].
	from := fromString ifNil: [emailAddr ifNil: [msg fieldNamed: 'from' ifAbsent: []]].
	to := toStringOrCollection ifNil: [msg fieldNamed: 'to' ifAbsent: []].
	msg cleanMessageFromAddr: from toAddr: to.
	^ {msg. from. to}