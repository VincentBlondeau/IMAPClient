initialize - release
initialize
	pretag := 'EMAIL'.
	tagseq := 0.
	self port: self class defaultPortNumber.
	folders := Dictionary new