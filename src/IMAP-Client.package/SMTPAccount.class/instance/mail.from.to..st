mail
mail: aMailMessageOrString from: fromString to: toStringOrCollection
	| answer msg from to |
	answer := self cleanMail: aMailMessageOrString from: fromString to: toStringOrCollection.
	msg := answer first.
	from := answer second.
	to := answer third.
	self client
		mailFrom: from
		to: (self makeRecipientList: to)
		text: msg text "asSendableText".
	^ msg