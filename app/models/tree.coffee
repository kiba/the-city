class Tree extends Wood
  constructor: (@x,@y) ->
    @name = "tree"
    @cuts_needed = 10
  collide: () ->
    true
  action: () ->
    "cut_down"
