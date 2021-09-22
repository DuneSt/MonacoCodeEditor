Class {
	#name : #MonacoDemoRoot,
	#superclass : #WAComponent,
	#instVars : [
		'currentDemo'
	],
	#category : #'MonacoCodeEditor-Demo'
}

{ #category : #'class initialization' }
MonacoDemoRoot class >> initialize [
	"WAAdmin applicationDefaults removeParent: WADevelopmentConfiguration instance."
	(WAAdmin register: self asApplicationAt: 'MonacoDemo')
		addLibrary: JQDeploymentLibrary;
		addLibrary: MonacoFileLibrary 
]

{ #category : #versions }
MonacoDemoRoot class >> version [
	^ 'v1.0.0'
]

{ #category : #accessing }
MonacoDemoRoot >> currentDemo [
	^ currentDemo
]

{ #category : #accessing }
MonacoDemoRoot >> currentDemo: anObject [
	currentDemo := anObject
]

{ #category : #initialization }
MonacoDemoRoot >> initialize [
	super initialize.
	self currentDemo: MonacoSimpleDemo new
]

{ #category : #rendering }
MonacoDemoRoot >> renderContentOn: html [
	html div
		class: 'monaco-demo';
		with: [ self renderDemoListOn: html.
			(html tag: 'main')
				with: [ html div
						class: 'monaco-demo-page';
						with: [ html render: self currentDemo ] ] ]
]

{ #category : #rendering }
MonacoDemoRoot >> renderDemoListOn: html [
	html div
		class: 'monaco-demo-list';
		with: [ html unorderedList: [ MonacoAbstractDemo allSubclasses do: [ :aDemoClass | self renderDemosListItemFor: aDemoClass on: html ] ] ]
]

{ #category : #rendering }
MonacoDemoRoot >> renderDemosListItemFor: aDemoClass on: html [
	html listItem
		class: 'monaco-demo-list-item_active' if: aDemoClass = self currentDemo class;
		with: [ html anchor
				callback: [ self currentDemo: aDemoClass new ];
				with: [ html span: aDemoClass title ] ]
]

{ #category : #hooks }
MonacoDemoRoot >> style [
	^ 'body, html{
	margin: 0;
	height: 100%;
	width: 100%;
	font-size: 14px;
	font-weight: 400;
	line-height: 20px;
	color: #757575;
	font-family: ''Roboto'',''Helvetica'',''Arial'', sans-serif;
}
	
.monaco-demo{
	display: flex;
	display: -webkit-flex;
	display: -ms-flexbox;
	background: #fafafa;
	height: 100%;
	width: 100%;
}

.monaco-demo-list{
	width: 225px;
	height: 100%;
	background-color: #FFF;
	box-shadow: 0 4px 5px 0 rgba(0,0,0,.14),0 1px 10px 0 rgba(0,0,0,.12),0 2px 4px -1px rgba(0,0,0,.2);
}

.monaco-demo-list ul{
	padding-left: 0;
	font-size: 14px;
	line-height: 24px;
	font-weight: 400;
	letter-spacing: 0;
}

.monaco-demo-list li{
	-webkit-transition: all 450ms cubic-bezier(.23, 1, .32, 1) 0ms;
	transition: all 450ms cubic-bezier(.23, 1, .32, 1) 0ms;
	width: 100%;
	line-height: 0;
}

.monaco-demo-list li a{
	padding-left: 15px;
	font-size: 16px;
	font-weight: inherit;
	display: -webkit-flex;
	color: rgba(0,0,0,0.87);
	text-decoration: none;
	white-space: nowrap;
	cursor: pointer;
}

.monaco-demo-list li a:hover{
	background-color: #eee;
}

.monaco-demo-list li a span{
	line-height: 60px;
}

.monaco-demo-list-item_active{
	background-color: rgba(206,147,216 ,1);
}

.monaco-demo-list li.monaco-demo-list-item_active a:hover{
	background-color: rgba(186,104,200 ,1);
}

.monaco-demo-list li.monaco-demo-list-item_active a{
	color: #FFF;
}

.monaco-demo main{
	display: inline-block;
	-webkit-flex-grow: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
	overflow: auto;
}

.monaco-demo-page{
	padding: 16px;
}

.monaco-demo-page-title{
	margin-bottom: 60px;
	margin-left: 32px;
	text-align: justify;
}

.monaco-demo-page-title h3{
	font-size: 16px;
	font-weight: 600;
	margin-top: 80px;
	text-transform: uppercase;
	color: rgba(0,0,0,.54);
	line-height: 40px;
}

.monaco-demo-page-title p{	
	margin-top: 16px;
	margin-bottom: 16px;
	font-size: 13px;
	max-width: 640px;
}

.monaco-demo-snippet-group{
	width: 100%;
	overflow: hidden;
	display: flex;
	display: -webkit-flex;
	display: -ms-flexbox;
	flex-direction: column;
}

.monaco-demo-snippet-demo pre, .monaco-demo .minimap-container{
	height: 400px;
	box-shadow: 0 4px 5px 0 rgba(0,0,0,.14),0 1px 10px 0 rgba(0,0,0,.12),0 2px 4px -1px rgba(0,0,0,.2);
	margin-bottom: 50px;
}

.monaco-demo pre{
	margin-top: 0;
	margin-bottom: 0;
	padding-top: 0;
	padding-bottom: 0;
}

.monaco-demo .minimap-container pre{
	width: initial;
}
'


]

{ #category : #rendering }
MonacoDemoRoot >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot link
		beStylesheet;
		url: 'https://fonts.googleapis.com/css?family=Roboto'.
	anHtmlRoot javascript
		url:
			'https://cdnjs.cloudflare.com/ajax/libs/monaco-editor/0.15.6/min/vs/loader.js'.
	anHtmlRoot title: 'Monaco Demo - ' , self class version
]
