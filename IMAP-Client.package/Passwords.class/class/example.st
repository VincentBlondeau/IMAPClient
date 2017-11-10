as yet unclassified
example
	"
	Passwords example
	"
	| passwd |
	passwd := Passwords new.
	passwd for: 'test'.
	"shouldn't be asked this time"
	^ passwd for: 'test'