as yet unclassified
bytesToString: anArray
	"
	MyIP bytesToString: #(192 168 0 1)
		=> '192.168.0.1'
	"
	| out |
	out := WriteStream on: String new.
	(anArray asArray collect: [:n | n asString]) do: [:ea | out nextPutAll: ea] separatedBy: [out nextPutAll: '.'].
	^ out contents