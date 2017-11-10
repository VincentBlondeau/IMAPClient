commands
append: aMailMessageOrString
	| msg response |
	msg := (aMailMessageOrString isKindOf: String)
		ifTrue: [aMailMessageOrString]
		ifFalse: [aMailMessageOrString text].
	(msg includes: Character lf)
		ifFalse: [msg := (msg split: String cr) merge: String crlf].

	response := self sendCommandNoWait: 'append "Sent Messages" {', msg size asString, '}'.
	(Delay forMilliseconds: 100) wait.
"	response = 'OK' ifFalse: [self error: 'appending message failed (maybe mailbox doesn''t exist)']."
	response := self sendCommandNoBeginTag: msg.
	response = 'OK' ifFalse: [self error: 'appending message failed']