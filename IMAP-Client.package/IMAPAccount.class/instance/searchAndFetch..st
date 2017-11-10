accessing
searchAndFetch: aString
	^ self client fetch: (client search: aString)