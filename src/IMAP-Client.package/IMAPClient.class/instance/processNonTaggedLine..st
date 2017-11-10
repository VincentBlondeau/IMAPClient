process response
processNonTaggedLine: aString
	| front low items |
	aString size < 4
		ifTrue: [ self error: 'string too small' ].
	" Transcript show: 'string too small <', aString, '>'; cr. ^ nil]."
	Transcript
		show: aString;
		cr.
	low := aString asLowercase.
	front := low copyFrom: 1 to: 4.
	front = '* ok'
		ifTrue: [ ^ self processOkLine: (aString copyFrom: 7 to: aString size - 1) ].
	front = '* fl'
		ifTrue: [ ^ self processFlagsLine: (aString copyFrom: 10 to: aString size - 1) ].
	front = '* li'
		ifTrue: [ ^ self processListLine: (aString copyFrom: 8 to: aString size) ].
	front = '* st'
		ifTrue: [ ^ self processStatusLine: (aString copyFrom: 10 to: aString size) ].
	 front = '* by'
		ifTrue: [ ^ self processLogout ].
	(low includesSubstring: 'expunge')
		ifTrue: [ ^ 'expunge' ].
	front = '* se'
		ifTrue: [ ^ self
				processSearch:
					(aString size > 9
						ifTrue: [ aString copyFrom: 10 to: aString size ]
						ifFalse: [ '' ]) ].
	items := low findBetweenSubstrings: ' '.
	items last = 'exists'
		ifTrue: [ ^ selectedBox numMsgs: (items at: items size - 1) asNumber ].
	items last = 'recent'
		ifTrue: [ ^ selectedBox numRecent: (items at: items size - 1) asNumber ].
	items third = 'fetch'
		ifTrue: [ ^ self processFetch: aString ].
	self unknown: 'unknown imap command' line: aString