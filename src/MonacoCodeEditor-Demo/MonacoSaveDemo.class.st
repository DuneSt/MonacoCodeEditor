Class {
	#name : #MonacoSaveDemo,
	#superclass : #MonacoAbstractDemo,
	#classInstVars : [
		'code'
	],
	#category : #'MonacoCodeEditor-Demo'
}

{ #category : #accessing }
MonacoSaveDemo class >> code [
	^ code
]

{ #category : #accessing }
MonacoSaveDemo class >> code: aString [
	code := aString
]

{ #category : #accessing }
MonacoSaveDemo class >> description [
	^ 'The code in  editor is keep betwwen each reload'
]

{ #category : #accessing }
MonacoSaveDemo class >> title [
	^ 'Simple demo'
]

{ #category : #rendering }
MonacoSaveDemo >> renderMonacoComponentOn: html [
	html
		render:
			((MonacoComponent
				code: self class code
				language: MonacoLanguage markdown)
				saveCallback: [ :text | self class code: text ])
]
