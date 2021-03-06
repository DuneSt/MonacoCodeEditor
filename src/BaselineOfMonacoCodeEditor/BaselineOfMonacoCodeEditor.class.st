Class {
	#name : #BaselineOfMonacoCodeEditor,
	#superclass : #BaselineOf,
	#category : #BaselineOfMonacoCodeEditor
}

{ #category : #baselines }
BaselineOfMonacoCodeEditor >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			"Dependencies"
			self
				seaside3: spec.
			
			"Packages"
			spec
				package: 'MonacoCodeEditor' with: [ spec requires: #('Seaside3') ];
				package: 'MonacoCodeEditor-Demo' with: [ spec requires: #('MonacoCodeEditor') ] ].
]

{ #category : #dependencies }
BaselineOfMonacoCodeEditor >> seaside3: spec [
	spec
		baseline: 'Seaside3'
		with: [ spec
				loads: #('Core' 'JQuery' 'Zinc');
				repository: 'github://SeasideSt/Seaside/repository' ]
]
