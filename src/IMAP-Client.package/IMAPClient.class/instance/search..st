commands
search: aString
	searchResults := nil.
	self sendCommand: 'search ', aString.
	^ searchResults