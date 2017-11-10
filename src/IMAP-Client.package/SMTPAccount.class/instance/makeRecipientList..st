mail
makeRecipientList: aStringOrCollection
	| recipient |
	recipient := aStringOrCollection.
	(recipient isKindOf: MIMEHeaderValue) ifTrue:
		[recipient := recipient mainValue].
	^ (recipient isKindOf: String)
		ifTrue: [(recipient findTokens: $,) collect: [:ea | ea withBlanksTrimmed]]
		ifFalse: [recipient].
