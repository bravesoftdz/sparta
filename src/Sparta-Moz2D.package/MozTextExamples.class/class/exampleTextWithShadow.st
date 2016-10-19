examples - text
exampleTextWithShadow
	| canvas rope textLayout |
	canvas := MozCanvas extent: 565 @ 345.
	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.

	canvas transform
		rotateByDegrees: 10;
		translateBy: 50@20;
		apply.	

	rope := SpRope from: 'Line 1' , String cr , 'Line 2' , String cr , 'Hello World!'.
	rope := rope
		attributes:
			{(SpForegroundColorAttribute color: Color veryVeryDarkGray).
			(SpShadowAttribute new
				offset: 2 @ 2;
				color: Color gray;
				radius: 1).
			(SpFontSizeAttribute size: 70).
			(SpFontWeightAttribute weight: 50).
			SpTextWrapAttribute new normal}
		from: 1
		to: rope size.
	rope := rope
		attributes:
			{SpFontStyleAttribute italic.
			(SpForegroundColorAttribute color: Color red)}
		from: 8
		to: 13.
	rope := rope attributes: {(SpFontWeightAttribute weight: 800)} from: 15 to: rope size.
	textLayout := SpTextLayout rope: rope.
	textLayout renderOn: canvas.
	canvas asForm asMorph openInWindowLabeled: 'Text with shadow'