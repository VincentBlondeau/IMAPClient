send command
makeSetsOf100: aCollection
	"
		change maxsetsize to 5
	IMAPClient new makeSetsOf100: #(1 2 3 4 5 6 7 8 9 10 11 12 13)
	"
	| sets origset maxsetsize |
	maxsetsize := 100.
	sets := OrderedCollection new.
	origset := aCollection.
	[origset notEmpty] whileTrue:
		[sets add: (origset copyFrom: 1 to: (maxsetsize min: origset size)).
		origset := origset size > maxsetsize
			ifTrue: [origset copyFrom: maxsetsize + 1 to: origset size]
			ifFalse: [OrderedCollection new]].
	^ sets