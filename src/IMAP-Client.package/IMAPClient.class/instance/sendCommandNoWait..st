send command
sendCommandNoWait: aString
	"could raise ConnectionTimedOut error"
	self sendSuperCommand: (self nextTag, aString).
	fetchResults := OrderedCollection new