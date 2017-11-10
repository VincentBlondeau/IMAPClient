send command
sendCommandNoBeginTag: aString
	"could raise ConnectionTimedOut error"
	self sendSuperCommand: aString.
	fetchResults := OrderedCollection new.
	^ self readResponse