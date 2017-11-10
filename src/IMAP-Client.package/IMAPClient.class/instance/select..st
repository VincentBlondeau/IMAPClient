commands
select: aString
	| quotedboxname boxname |
	quotedboxname := (aString at: 1) = $"
		ifTrue: [aString]
		ifFalse: ['"', aString, '"'].
	boxname := quotedboxname copyFrom: 2 to: quotedboxname size - 1.
	selectedBox := folders at: boxname ifAbsentPut: [IMAPFolder new name: boxname].
	^ self sendCommand: 'select ', quotedboxname