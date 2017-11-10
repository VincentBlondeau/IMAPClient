fetching
fetchNew
	| numMsgs msgs |
	self client noop.
	lastFetchedNum ifNil: [lastFetchedNum := client selectedBox numMsgs].
	numMsgs := client selectedBox numMsgs.
	lastFetchedNum < numMsgs ifFalse: [^ OrderedCollection new].
	msgs := client fetch: (lastFetchedNum + 1) asString , ':' , numMsgs asString.
	lastFetchedNum := numMsgs.
	^ msgs