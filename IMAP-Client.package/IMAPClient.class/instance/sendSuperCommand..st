send command
sendSuperCommand: aString
	Transcript show: aString asString; cr.
	super sendCommand: aString