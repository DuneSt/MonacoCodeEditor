Class {
	#name : #MonacoLanguage,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'MonacoCodeEditor-Core'
}

{ #category : #'as yet unclassified' }
MonacoLanguage class >> java [
	^ self new
		name: #java;
		yourself
]

{ #category : #'as yet unclassified' }
MonacoLanguage class >> markdown [
	^ self new
		name: #markdown;
		yourself
]

{ #category : #'as yet unclassified' }
MonacoLanguage class >> smalltalk [
	^ self new
		name: #smalltalk;
		yourself
]

{ #category : #'as yet unclassified' }
MonacoLanguage class >> typescript [
	^ self new
		name: #typescript;
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
