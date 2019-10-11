Class {
	#name : #MonacoComponent,
	#superclass : #WAComponent,
	#instVars : [
		'code',
		'language'
	],
	#category : #MonacoCodeEditor
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
		id: 'container';
		style: 'width:100%;height:600px;border:1px solid grey;'.
	html document
		addLoadScript:
			(html jQuery ajax
				onBeforeSend:
					(JSStream
						on:
							'require.config({ paths: { ''vs'': ''https://cdnjs.cloudflare.com/ajax/libs/monaco-editor/0.15.6/min/vs'' }});
					require([''https://cdnjs.cloudflare.com/ajax/libs/monaco-editor/0.15.6/min/vs/editor/editor.main''], function() {});
');
				text: [ :stream | 200 milliseconds wait. stream nextPutAll: self code value ];
				onSuccess:
					'monaco.editor.create(document.getElementById(''container''), {
            value: arguments[0],
            language: ''' , self language monacoCode
						,
							'''
        })')
]
