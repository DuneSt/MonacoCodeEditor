Class {
	#name : #MonacoAbstractDemo,
	#superclass : #WAComponent,
	#category : #'MonacoCodeEditor-Demo'
}

{ #category : #accessing }
MonacoAbstractDemo class >> description [
	^ self subclassResponsibility
]

{ #category : #accessing }
MonacoAbstractDemo class >> isAbstract [
	^ self = MonacoAbstractDemo
]

{ #category : #accessing }
MonacoAbstractDemo class >> title [
	^ self subclassResponsibility
]

{ #category : #accessing }
MonacoAbstractDemo >> description [
	^ self class description
]

{ #category : #rendering }
MonacoAbstractDemo >> renderCodeOfDemoOn: html [
	html heading
		level3;
		with: 'Code:'.
	html div
		class: 'monaco-demo-snippet-code';
		with: [ html text: #TODO"html
				render:
					(PrismComponent new
						sourceCode: [ (self class >> #renderPrismComponentOn:) sourceCode ];
						language: #smalltalk;
						enableCopyOnClick;
						yourself)" ]
]

{ #category : #rendering }
MonacoAbstractDemo >> renderContentOn: html [
	self renderTitleOn: html.
	html div
		class: 'monaco-demo-snippet-group';
		with: [ self renderDemoOn: html.
			self renderCodeOfDemoOn: html ].
]

{ #category : #rendering }
MonacoAbstractDemo >> renderDemoOn: html [
	html div
		class: 'monaco-demo-snippet-demo';
		with: [ self renderMonacoComponentOn: html ]
]

{ #category : #rendering }
MonacoAbstractDemo >> renderMonacoComponentOn: html [
	^ self subclassResponsibility
]

{ #category : #rendering }
MonacoAbstractDemo >> renderTitleOn: html [
	html div
		class: 'monaco-demo-page-title';
		with: [ html heading
				level3;
				with: self title.
			html paragraph: self description.
			self warningDescription ifNotNil: [ :desc | html strong: desc ] ]
]

{ #category : #accessing }
MonacoAbstractDemo >> title [
	^ self class title
]

{ #category : #accessing }
MonacoAbstractDemo >> warningDescription [
	"If a demo needs a warning, override this method."

	^ nil
]
