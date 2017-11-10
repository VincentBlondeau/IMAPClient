send command
msgNumsFromCollection: aCollection
	^ (aCollection collect: [:ea | ea asString]) merge: ','