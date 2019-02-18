Class {
	#name : #MonacoSimpleDemo,
	#superclass : #MonacoAbstractDemo,
	#category : #'MonacoCodeEditor-Demo'
}

{ #category : #accessing }
MonacoSimpleDemo class >> description [
	^ 'TODO'
]

{ #category : #accessing }
MonacoSimpleDemo class >> title [
	^ 'Simple demo'
]

{ #category : #rendering }
MonacoSimpleDemo >> renderMonacoComponentOn: html [
	html render: MonacoComponent new
]
