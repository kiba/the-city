class Lightboar extends Unit
  constructor: (x,y,name) ->
    super(@x,@y,2,name)
  set_action: (map) ->
    return if this.act_on_queue()
    switch(@queue[@order])
      when "decide"
        object = nearest_object(this,map.stockpoints)
        this.set_move(object.x,object.y)