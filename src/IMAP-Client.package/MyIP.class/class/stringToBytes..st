as yet unclassified
stringToBytes: aString
	"
	MyIP stringToBytes: '192.168.0.1'
	"
	^ ((aString findTokens: $.) collect: [:n | n asInteger]) asByteArray