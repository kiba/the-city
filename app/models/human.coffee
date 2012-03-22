class Human extends Unit
  constructor: (x, y, name,gender) ->
    super(x, y, 1,name,gender)
    @hostility = 0
    @advance = true
    @agility = 5
  gather_action: (map) ->
    switch(@queue[@order])
      when "move_to_drop"
        object = @job.get_drop_location(map)
        if object == false
          @job = null
          @queue = []
          @perform = null
          return false
        choices = map.free_locations(object.x,object.y,1)
        choice = choices[random_number(choices.length)]
        this.set_move(choice.x,choice.y)
      when "move_to_source"
        @advance = true
        object = @job.find_nearest(map)
        if object == null
          if map.trees.length != 0 || map.logs.length != 0
            @advance = false
            return false
          else
            @job = null
            @queue = []
            @perform = null
          return false
        choices = map.free_locations(object.x,object.y,1)
        choice = choices[random_number(choices.length)]
        this.set_move(choice.x,choice.y)
      when "gather_item"
        this.acquire_item(@job.nearest.acquire())
        @job.delete_nearest_if_empty(map)
      when "drop_item"
        this.drop_item(@job.store)
        map.drop_item(@job.drop.x,@job.drop.y,@job.store)
    true
  cut_action: (map) ->
    switch(@queue[@order])
      when "find"
        object = @job.find_nearest_cut(map)
        if object == false
          @job = null
          @queue = []
          @perform = null
          return false
        choices = map.free_locations(object.x,object.y,1)
        choice = choices[random_number(choices.length)]
        this.set_move(choice.x,choice.y)
      when "cut_down"
        if @job.target.cut() == true
          @advance = true
          map.sketch.cut_down(@job.target.x,@job.target.y)
          return (action: "cut", person: this.name, resource: @job.target.identify())
        else
          @advance = false
          return false
    true
  set_action: (map) ->
    return if this.act_on_queue()
    return if @body.hand == 2
    switch (@queue_type)
      when 0
        status = this.gather_action(map)
      when 1
        status = this.cut_action(map)
    if status != false
      @perform = @order
      return
    return status
