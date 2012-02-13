class mapDraw
  constructor: (@p5) ->
    @drawable = false
  draw_dirty_rect = (dirty,map) ->
    if @drawable == false
      this.output_map(map)
      @drawable = true
      return
    for d in dirty
      location = map.map[d.y][d.x]
      x = (d.x - map.camera_x) * 20
      y = (d.y - map.camera_y) * 20
      if location != null
        this.determine_draw(location,x,y)
      else
        @p5.noStroke()
        @p5.fill(0)
        @p5.rect(x,y,20,20)
  determine_draw: (location,x,y) ->
    switch(location.name)
      when "floor"
        floor_draw(@p5,x,y)
      when "crystal_tree" #Crystal tree
        crystal_tree_draw(@p5,x,y)
      when "crystal_stockpile" #Crystal stockpile
        crystal_stockpile_draw(@p5,x,y)
      when "crystal"
        crystal_draw(@p5,x,y,object.items)

  output_map: (map,p5) ->
    p5.background(0)
    results = map.map
    end_y = map.camera_y + 30
    end_x = map.camera_x + 40
    for height in [map.camera_y..end_y]
      for width in [map.camera_x..end_x]
        x = 20 * (width - map.camera_x)
        y = 20 * (height - map.camera_y)
        object = results[height][width]
        p5.stroke(255,255,255)
        if object != null
          this.determine_draw(object,x,y)
