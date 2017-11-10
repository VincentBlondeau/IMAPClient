*IMAP-Client-model
regenerateTextWithLf
	"regenerate the full text from the body and headers"
	| encodedBodyText |
	text := String streamContents: [ :str |
		"first put the header"
		fields keysAndValuesDo: [ :fieldName :fieldValues |
			fieldValues do: [ :fieldValue |
				str
					nextPutAll: fieldName capitalized ;
					nextPutAll: ': ';
					nextPutAll: fieldValue asHeaderValue;
					crlf ]. ].
	
		"skip a line between header and body"
		str crlf.

		"put the body, being sure to encode it according to the header"
		encodedBodyText := body content.
		self decoderClass ifNotNil: [
			encodedBodyText := (self decoderClass mimeEncode: (ReadStream on: encodedBodyText)) upToEnd ].
		str nextPutAll: encodedBodyText ].