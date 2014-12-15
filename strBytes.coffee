###
文字バイト数をカウント（全角:2バイト,半角:1バイト）
@param 文字列
@return 総バイト数
###
strBytes = (str) ->

	#str = elem.innerText

	r = 0
	for i in [0..(str.length-1)] 
        c = str.charCodeAt i 
        
        #Shift_JIS: 0x0 ～ 0x80, 0xa0 , 0xa1 ～ 0xdf , 0xfd ～ 0xff 
        #Unicode : 0x0 ～ 0x80, 0xf8f0, 0xff61 ～ 0xff9f, 0xf8f1 ～ 0xf8f3 
        if (c >= 0x0 && c < 0x81) || (c == 0xf8f0) || (c >= 0xff61 && c < 0xffa0) || (c >= 0xf8f1 && c < 0xf8f4)
            r += 1 
        else 
            r += 2 
	
	return r

###
文字列に指定した文字がどのくらい含まれるのかをカウント
@param 文字列
@param 指定した文字(1文字目の文字をカウント)
@return 指定した文字が含まれる数	
###    
strMatches =(str,para) ->
	#console.log "startMatches"
	r = 0
	pCode = para.charCodeAt 0
	for i in [0..(str.length-1)]
		c = str.charCodeAt i
		if c is pCode
			r += 1

	return r
