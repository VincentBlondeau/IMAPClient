*IMAP-Client-model
dateToday
	"
	MailMessage new dateToday
	"
	^ ((Date today weekday) asString copyFrom: 1 to: 3), ', ', (Date today printFormat: #(1 2 3 $  2 1)), ' ', Time now print24, ' -0400 (EST)'

