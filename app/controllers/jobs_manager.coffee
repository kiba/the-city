class JobsManager
  constructor: (@map,@units) ->
    @queue = []
  run: () ->
    return -1 if @queue.length == 0
    for u in @units
      if u.job == null
        u.job = @queue[0]
        @queue = @queue.slice(0,0)
  queuing: () ->
    for s in @map.stockpoints
      if s.check_assign() == false
        @queue.push(s)