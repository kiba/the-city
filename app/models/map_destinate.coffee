class MapDestinate
  constructor: (@map) ->
  decide_stock: (mouse,x,y) ->
    switch(mouse.build)
      when "tree"
        return new WoodStock(x,y)
      when "crystal"
        return new CrystalStock(x,y)
  decide_list: (mouse) ->
    switch(mouse.build)
      when "tree"
        return @map.trees
      when "crystal"
        return @map.crystal_trees

  add_stockpile:(mouse) ->
    x = Math.floor(mouse.x / 20) + @map.camera.x
    y = Math.floor(mouse.y / 20) + @map.camera.y
    return if x < 2 || x > 97
    return if y < 2 || y > 97
    newpoint = this.decide_stock(mouse,x,y)
    unless @map.stockpoints_collision_detect(newpoint) == true || @map.collide_check(x,y) == true
      @map.map[y][x].push(newpoint)
      newpoint.nearest = nearest_object(newpoint,this.decide_list(mouse))
      @map.stockpoints.push(newpoint)