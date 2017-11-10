exampl
searchAndFetchExample
	"
	IMAPAccount eastBmd searchAndFetchExample
	"
	| imap selected |
	imap := IMAPAccount eastBmd.
	selected := imap searchAndFetch: 'subject "[bbb exer 1.1x, iter 1]" from "watch.officer"'.
	imap close.
	^ selected