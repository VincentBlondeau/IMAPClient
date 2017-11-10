process response
processSearch: aString
	searchResults := aString size = 0
		ifFalse: [(aString split: ' ') collect: [:ea | ea asNumber]]
		ifTrue: [OrderedCollection new]