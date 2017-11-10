commands
fetch: aStringNumberOrCollection
	| msgnums response index |
"	(aStringNumberOrCollection size = 1 and: [aStringNumberOrCollection first = 0])
		ifTrue: [^ OrderedCollection new].
"
	aStringNumberOrCollection ifEmpty: [^ OrderedCollection new].
	msgnums := ((aStringNumberOrCollection isKindOf: Collection)
				and: [(aStringNumberOrCollection isKindOf: String) not])
		ifTrue: [self msgNumsFromCollection: aStringNumberOrCollection]
		ifFalse: [aStringNumberOrCollection asString].
	response := self sendCommand: 'fetch ', msgnums, ' body[]'.
	response = 'OK' ifFalse: [self error: 'Fetch failed'].
	fetchResults := fetchResults collect:
		[:ea |
		index := ea indexOf: $}.
		ea copyFrom: index+1 to: ea size].
	^ fetchResults collect: [:ea | MailMessage from: ea]