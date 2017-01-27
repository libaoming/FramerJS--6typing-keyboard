inputHeight = 130
bottomBarHeight = 110 
msgCount = 0
msgList = []

backgroundA = new BackgroundLayer

bottomBar = new Layer 
	x: 0
	y: Screen.height - bottomBarHeight
	width:Screen.width
	height: bottomBarHeight
	backgroundColor: 'f5f5f5'


sendButton = new Layer
	parent: bottomBar
	html: 'send'
	backgroundColor: null
	height: bottomBarHeight
	x: Align.right
	style: 
		'color':'#2153ef'
		'font-size':'3rem'
		'padding-top':'2.5rem'
		'text-align':'center'
		

sendButton.states.add(pressed:{opacity:0.5,scale:0.98})
sendButton.states.animationOptions = curve:'spring(400,10,0)'

	


sendButton.onTouchStart ->
	sendButton.states.switch('pressed')
sendButton.onTouchEnd ->
	sendButton.states.switch('default')
	

textInput = new Layer
	x: 0
	y: Screen.height - 2 * bottomBarHeight
	height: bottomBarHeight
	width: Screen.width
	backgroundColor: '#fff'
	style: 
		'border-top':'1px solid  lightgray'

inputBox = document.createElement('input')
inputBox.style['font-size'] = '2.5rem'
inputBox.style['padding-top'] = 'rem'
inputBox.style['padding-left'] = '2rem'
inputBox.style['width'] = Screen.width + 'px'
inputBox.style['height'] = textInput.height + 'px'


inputBox.focus()
inputBox.value = ''
inputBox.placeholder = 'type a message'

textInput._element.appendChild(inputBox)

sendButton.onClick ->
	text = inputBox.value
	inputBox.value = ''
	
	if text.length != 0 
		msgCount += 1
		message = new Layer
			index : 1
			height: 100
			width: 18 * text.length + 100
			backgroundColor: '#216fef'
			html:  text
			y: textInput.y - 150
			style: 
				'font-size': 36 + 'px'
				'text-align':'center'
				'padding-top': 30 + 'px'
		message.borderRadius = message.height/2.1
		message.x = Screen.width - message.width - 30
		msgList.push(message)
		
		for i in [0...msgCount]
			msgList[i].animate
				properties:
					y: msgList[i].y - 120
				curve: 'spring(300,23,0)'
			
			if i > 0
				msgList[0].borderRadius = '44px 44px 10px 44px'
				msgList[msgCount-1].borderRadius = '44px 10px 44px 44px'
	