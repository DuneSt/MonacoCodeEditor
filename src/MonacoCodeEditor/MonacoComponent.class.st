Class {
	#name : #MonacoComponent,
	#superclass : #WAComponent,
	#instVars : [
		'code',
		'language',
		'waitingMessage'
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
						url: (CYSFileLibrary urlOf: 'cog.gif').
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
	component := html div
		class: 'monaco-container';
		style: 'width:100%;height:600px;border:1px solid grey;';
		attributeAt: #'data-language' put: self language name;
		yourself.
	self code
		ifNotNil: [ component attributeAt: #'data-code' put: self code ].
	component with: [ self waitingMessage value: html ]
]

{ #category : #rendering }
MonacoComponent >> waitingMessage [
	^ waitingMessage ifNil: [ self defaultWaitingHtml ]
]

{ #category : #rendering }
MonacoComponent >> waitingMessage: anObject [
	waitingMessage := anObject
]
