drawFloatText = (text,p5) ->
  if p5.__frameRate % 500
    text.decrease()
#    text.change_pos()
  if text.time > 0
    return boxedText(p5,text.x * 20,text.y * 20,text.msg)
  false