commands
forMessages: aStringNumberOrCollection addFlags: aCollection
	| msgnums response |
	(aStringNumberOrCollection size = 1 and: [aStringNumberOrCollection first = 0])
		ifTrue: [^ OrderedCollection new].
	aStringNumberOrCollection ifEmpty: [^ OrderedCollection new].
	(aStringNumberOrCollection size > 100 and: [(aStringNumberOrCollection isKindOf: String) not]) ifTrue:
		[(self makeSetsOf100: aStringNumberOrCollection) do:
			[:set | self forMessages: set addFlags: aCollection].
		^ nil].
	msgnums := ((aStringNumberOrCollection isKindOf: Collection)
				and: [(aStringNumberOrCollection isKindOf: String) not])
		ifTrue: [self msgNumsFromCollection: aStringNumberOrCollection]
		ifFalse: [aStringNumberOrCollection asString].
	response := self sendCommand: 'store ', msgnums, ' +FLAGS (',(aCollection merge: ' '), ')'.
	response = 'OK' ifFalse: [self error: 'adding flag failed']