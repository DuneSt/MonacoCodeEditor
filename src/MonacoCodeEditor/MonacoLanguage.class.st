Class {
	#name : #MonacoLanguage,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #MonacoCodeEditor
}

{ #category : #'as yet unclassified' }
MonacoLanguage class >> smalltalk [
	^ self new
		name: #smalltalk;
		yourself
]

{ #category : #accessing }
MonacoLanguage >> monacoCode [
	^ self name
]

{ #category : #accessing }
MonacoLanguage >> name [
	^ name
]

{ #category : #accessing }
MonacoLanguage >> name: anObject [
	name := anObject
]
