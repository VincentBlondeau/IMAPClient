as yet unclassified
start
	"
	MyIP start
	"
	(MyScheduler instance)
		removeTasksNamed: 'myip checker';
		add: (MyScheduleTask
			name: 'myip checker'
			block: [self isIpAddrChanged ifTrue: [self ipHasChanged]]
			frequency: 5 minutes)