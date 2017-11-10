process response
processTaggedLine: aString
	| items |
	lastResponse := aString.
	self show: '**** ', lastResponse.
	items := lastResponse findBetweenSubstrings: ' '.
	(items size = 4 and: [items third ~= 'LOGIN']) ifTrue: [selectedBox permissions: (items at: 3)].
	^ items at: 2