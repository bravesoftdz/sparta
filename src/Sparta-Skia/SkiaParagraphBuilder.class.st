Class {
	#name : #SkiaParagraphBuilder,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-External'
}

{ #category : #'private - ffi' }
SkiaParagraphBuilder class >> primCreateStyle: aSkiaParagraphStyle fontCollection: aSkiaFontCollection [
	^ self ffiCall: #(void* skia_paragraph_builder_new(
		SkiaParagraphStyle aSkiaParagraphStyle,
		SkiaFontCollection aSkiaFontCollection))
]

{ #category : #'private - ffi' }
SkiaParagraphBuilder class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_paragraph_builder_drop(void* aHandle))
]

{ #category : #'instance creation' }
SkiaParagraphBuilder class >> style: aSkiaParagraphStyle fontCollection: aSkiaFontCollection [
	^ self fromNativeHandle: (self primCreateStyle: aSkiaParagraphStyle fontCollection: aSkiaFontCollection)
]

{ #category : #'api - builder' }
SkiaParagraphBuilder >> addPlaceholder: aSkiaParagraphPlaceholderStyle [
	self primAddPlaceholder: aSkiaParagraphPlaceholderStyle
]

{ #category : #'api - builder' }
SkiaParagraphBuilder >> addString: aString [
	GtBoxerString
		fromString: aString
		during: [ :aGtBoxerString | self primAddText: aGtBoxerString ]
]

{ #category : #'api - builder' }
SkiaParagraphBuilder >> build [
	^ SkiaParagraph fromNativeHandle: self primBuild
]

{ #category : #'api - builder' }
SkiaParagraphBuilder >> popStyle [
	self primPopStyle
]

{ #category : #'private - ffi' }
SkiaParagraphBuilder >> primAddPlaceholder: aSkiaParagraphPlaceholderStyle [
	^ self ffiCall: #(void skia_paragraph_builder_add_placeholder(self, SkiaParagraphPlaceholderStyle aSkiaParagraphPlaceholderStyle))
]

{ #category : #'private - ffi' }
SkiaParagraphBuilder >> primAddText: aGtBoxerString [
	^ self ffiCall: #(void skia_paragraph_builder_add_text(self, GtBoxerString aGtBoxerString))
]

{ #category : #'private - ffi' }
SkiaParagraphBuilder >> primBuild [
	^ self ffiCall: #(void* skia_paragraph_builder_build(self))
]

{ #category : #'private - ffi' }
SkiaParagraphBuilder >> primPopStyle [
	self ffiCall: #(void skia_paragraph_builder_pop_style(self))
]

{ #category : #'private - ffi' }
SkiaParagraphBuilder >> primPushStyle: aSkiaParagraphTextStyle [
	self ffiCall: #(void skia_paragraph_builder_push_style(self, SkiaParagraphTextStyle aSkiaParagraphTextStyle))
]

{ #category : #'api - builder' }
SkiaParagraphBuilder >> pushStyle: aSkiaParagraphTextStyle [
	self primPushStyle: aSkiaParagraphTextStyle
]