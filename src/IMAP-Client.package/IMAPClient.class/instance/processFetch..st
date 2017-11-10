process response
processFetch: aString
	| index length result |
	index := aString indexOf: ${.
	index ~= 0
		ifFalse:
			[result := '']
		ifTrue:
			[length := (aString copyFrom: index + 1 to: aString size - 1) asNumber.
			result := self stream next: length.
"self show: '<<<<<<<<',result,'>>>>>>>>>'."
			self stream nextLine  "should be the ')' line"].
	fetchResults add: aString, result