accessing
searchAndRemove: aString
	^ self client remove: (client search: aString)