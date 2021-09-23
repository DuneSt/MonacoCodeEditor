Class {
	#name : #MonacoComponent,
	#superclass : #WAComponent,
	#instVars : [
		'code',
		'language',
		'waitingMessage',
		'timeBeforeSaveOnStopTyping',
		'saveOnLooseFocus',
		'saveCallback'
	],
	#category : #'MonacoCodeEditor-Core'
}

{ #category : #'instance creation' }
MonacoComponent class >> code: codeString language: aMonacoLanguage [
	^ self new
		code: codeString;
		language: aMonacoLanguage;
		yourself
]

{ #category : #accessing }
MonacoComponent >> code [
	^ code
]

{ #category : #accessing }
MonacoComponent >> code: anObject [
	code := anObject
]

{ #category : #rendering }
MonacoComponent >> defaultWaitingHtml [
	^ [ :html | 
	html div
		class: 'tlWaiting';
		with: [ 
					html image
						style: 'height: 50px; width: 50px;';
						url: (MonacoFileLibrary urlOf: 'cog.gif').
					html heading
						level1;
						with: 'Please wait, loading in progress' ];
		yourself ]
]

{ #category : #accessing }
MonacoComponent >> language [
	^ language
]

{ #category : #accessing }
MonacoComponent >> language: anObject [
	language := anObject
]

{ #category : #rendering }
MonacoComponent >> renderContentOn: html [
	| component |
	html div
		class: 'monaco-container';
		style: 'position: relative';
		with: [ self renderSaveButton: html.
			component := html div
				class: 'monaco-container-editor';
				style: 'width:100%;height:600px;border:1px solid grey;';
				attributeAt: #'data-language' put: self language name;
				yourself.
			self code
				ifNotNil: [ component attributeAt: #'data-code' put: self code ].
			component with: [ self waitingMessage value: html ] ]
]

{ #category : #rendering }
MonacoComponent >> renderSaveButton: html [
	self saveCallback
		ifNotNil: [ html image
				style:
					'height: 25px;width: 25px;position: absolute;top: 5px;right: 140px;z-index: 10;';
				url: (MonacoFileLibrary urlOf: 'saveIconSvg');
				onClick: (self saveJSScript: html) ]
]

{ #category : #rendering }
MonacoComponent >> saveCallback [
	^ saveCallback
]

{ #category : #rendering }
MonacoComponent >> saveCallback: aBlock [
	saveCallback := aBlock
]

{ #category : #rendering }
MonacoComponent >> saveJSScript: html [
	|ajax|
	ajax := html jQuery ajax.
	^ ajax
		type: 'POST';
		callback:  self saveCallback
		value: (JSStream on: 'MonacoBinding.save(event.target)');
		onComplete: 'MonacoBinding.saveCompleted(event.target)';
		onError: 'MonacoBinding.saveFailed(event.target)'
]

{ #category : #rendering }
MonacoComponent >> waitingMessage [
	^ waitingMessage ifNil: [ self defaultWaitingHtml ]
]

{ #category : #rendering }
MonacoComponent >> waitingMessage: anObject [
	waitingMessage := anObject
]
