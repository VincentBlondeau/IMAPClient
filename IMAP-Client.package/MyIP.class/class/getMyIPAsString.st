as yet unclassified
getMyIPAsString
	"
	MyIP getMyIPAsString
	"
	| content start end |
	[content := self defaultUrl asUrl retrieveContents contents.
	start := content indexOfSubCollection: 'Your IP'.
	end := content indexOfSubCollection: '</TITLE>'.
	^ (start = 0 or: [end = 0])
		ifTrue: [nil]
		ifFalse: [content copyFrom: start + 9 to: end - 1]]

	on: Exception
	do: [^ 'could not retrieve ip address']