fetching
searchAndRemove: aString
	^ self client remove: (client search: aString)