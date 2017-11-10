internal
readResponse
	| line |
	[true] whileTrue:
		[line := self stream nextLine.
		line := line trimmed.
		(line indexOfSubCollection: thistag) = 1
			ifTrue: [^ self processTaggedLine: line]
			ifFalse: [self processNonTaggedLine: line]]