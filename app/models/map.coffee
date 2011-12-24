class Map
  constructor: (width, height) ->
    @map = new Array(height)
    for h in [0..height] when h < height
      @map[h] = new Array(width)
  generate: ->
    for h in [0..@map.length] when h < @map.length
      for w in [0..@map[h][0].length] when w < @map[0].length
        if Math.random * 10 > 5
          @map[h][w] = 1
        else
          @map[h][w] = 0