send command
sendNoWait: aString
	"could raise ConnectionTimedOut error"
	self sendSuperCommand: aString.
	fetchResults := OrderedCollection new