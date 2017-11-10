fetching
select: aString
	| answer |
	answer := self client select: aString.
	lastFetchedNum := client selectedBox numMsgs.
	^ answer