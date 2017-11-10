as yet unclassified
alarmOnNewMessageIterations: iterationInteger withSecondDelay: secondDelay then: aBlock
	"
	self alarmOnNewMessageIterations: 10 withSecondDelay: 90
	IMAPAccount macLocal alarmOnNewMessageIterations: 10 withSecondDelay: 90 then:
		[:e | e close]
	"
	| nummsgs newnummsgs |
	nummsgs := self client selectedBox numMsgs.
	[1 to: iterationInteger do:
		[:n |
		self client noop.
		newnummsgs := client selectedBox numMsgs.
		nummsgs ~= client selectedBox numMsgs ifTrue:
			[AbstractSound busySignal: 3.
			Transcript cr; show: '************** new message in ', emailAddr asString; cr.
			nummsgs := newnummsgs].
		(Delay forSeconds: secondDelay) wait]] forkNamed: emailAddr asString, ' alarm'.
	aBlock value: self