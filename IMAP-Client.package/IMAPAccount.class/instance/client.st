accessing
client
	^ client ifNil: [ client := IMAPClient new ]