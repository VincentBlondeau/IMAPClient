as yet unclassified
processListLine: aString
 "'() ""/"" ""inbox""'"
	| substrings item1 rootFolder folder |
	substrings := aString substrings: '"'.
	item1 := substrings first.
	rootFolder := substrings second.
	folder := substrings fourth.
	fetchResults add: folder.
	