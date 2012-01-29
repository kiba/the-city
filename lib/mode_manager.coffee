class ModeManager
  constructor: ->
    @modes = initializeModes()
    @n = 1
  act: (n) ->
    @modes[n].act()
  input: (n,result) ->
    @modes[n].input(result)
  update_draw: (n) ->
    return @modes[n].update_draw()
  update_mode: (n) ->
    object = @modes[n].update_mode(n)
   #Need to clean up eventually
    return object
  game_mode: (name) ->
    @modes[0].units.initialize_scenario(name)
  mouse_input:(n,result) ->
    @modes[n].mouse_input(result)
  switch_mode: (n) ->
    @n = n
    if @n == 0
      this.game_mode("game")