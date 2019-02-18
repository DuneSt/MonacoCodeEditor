Class {
	#name : #MonacoComponent,
	#superclass : #WAComponent,
	#category : #MonacoCodeEditor
}

{ #category : #rendering }
MonacoComponent >> renderContentOn: html [
	| component |
	component := html div
		id: 'container';
		style: 'width:100%;height:600px;border:1px solid grey;'.
		
	html document addLoadScript: (JSStream on: 'require.config({ paths: { ''vs'': ''https://cdnjs.cloudflare.com/ajax/libs/monaco-editor/0.15.6/min/vs'' }});
    require([''https://cdnjs.cloudflare.com/ajax/libs/monaco-editor/0.15.6/min/vs/editor/editor.main''], function() {
    });
	setTimeout(function(){console.log("Start1");var editor = monaco.editor.create(document.getElementById(''container''), {
            value: [
                ''function x() {'',
                ''\tconsole.log("Hello world!");'',
                ''}''
            ].join(''\n''),
            language: ''st''
        });}, 500 );
');
		yourself.
]
