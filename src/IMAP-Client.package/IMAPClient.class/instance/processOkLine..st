process response
processOkLine: aString
	| low front |
	low := aString asLowercase.
	front := low copyFrom: 1 to: 4.
	front = 'perm' ifTrue: [^ selectedBox permFlags: ((aString copyFrom: 16 to: aString size -1) findBetweenSubstrings: ' ')].
	front = 'unse' ifTrue: [^ selectedBox numUnseen: (aString copyFrom: 8 to: aString size) asNumber].
	front = 'uidv' ifTrue: [^ selectedBox uidValidity: (aString copyFrom: 13 to: aString size) asNumber].
	front = 'uidn' ifTrue: [^ selectedBox uidNext: (aString copyFrom: 9 to: aString size) asNumber].
	self unknown: 'unknown imap ok command' line: aString