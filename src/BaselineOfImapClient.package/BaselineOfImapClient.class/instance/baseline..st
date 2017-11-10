baselines
baseline: spec
	<baseline>
	spec
		for: #(common)
		do: [ spec
				package: 'Imap-Client' ;
				package: 'Imap-Test' with: [ spec requires: #(Mocketery 'Imap-Client') ].
			spec baseline: 'Mocketry' with: [ spec repository: 'github://dionisiydk/Mocketry:v4.0.x' ].
			spec group: 'default' with: #('Imap-Test') ]