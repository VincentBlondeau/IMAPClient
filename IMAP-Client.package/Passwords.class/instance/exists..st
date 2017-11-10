as yet unclassified
exists: aString
	^ (self dict at: aString ifAbsentPut: [#notThereAnywhere]) ~= #notThereAnywhere