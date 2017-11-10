as yet unclassified
for: aString ifNone: aBlock
	"
	Passwords for: 'this is a test'
	"
	^ (self current exists: aString)
		ifTrue: [self current for: aString]
		ifFalse: [aBlock value]