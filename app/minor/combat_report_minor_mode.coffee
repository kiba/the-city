class CombatReportMinorMode
  constructor:(@parent) ->
    @msg = []
    @options = new TextOptions()
    @relations = @parent.units.msg_manager.relations

  act: ->
  input: (result) ->
  input_info: (@msg) ->
  update_draw: () ->
    return (relations: @relations, pointer: @pointer, state: @parent.state)
