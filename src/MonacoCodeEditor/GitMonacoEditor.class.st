Class {
	#name : #GitMonacoEditor,
	#superclass : #GitBridge,
	#category : #'MonacoCodeEditor-Libraries'
}

{ #category : #'class initialization' }
GitMonacoEditor class >> initialize [
	SessionManager default registerSystemClassNamed: self name
]

{ #category : #'class initialization' }
GitMonacoEditor class >> resources [
	^ self root / 'resources'
]
