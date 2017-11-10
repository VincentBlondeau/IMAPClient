as yet unclassified
isIpAddrChanged
	"
	MyIP isIpAddrChanged
	"
	| newipaddr |
	newipaddr := self getMyIPAsString.
	^ (IpAddr = newipaddr)
		ifTrue: [false]
		ifFalse: [IpAddr := newipaddr. true]