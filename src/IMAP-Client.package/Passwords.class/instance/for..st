as yet unclassified
for: aString
	^ self dict at: aString ifAbsentPut: [(FillInTheBlank request: 'Enter the password for ', aString)]