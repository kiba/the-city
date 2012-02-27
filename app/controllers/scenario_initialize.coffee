class ScenarioInitialize
  constructor: (@units,@map) ->
  create: (name) ->
    switch(name)
      when "combat"
        @units.create new Human(10,10,"Miya",1)
        @units.create new Human(10,20, "John",0)
        @units.units[0].target = @units.units[1]
        @units.units[1].stance = 1
      when "leg_disability"
        @units.create new Human(10,10, "Can'tWalk",0)
        @units.units[0].body.leg = 2
        @units.units[0].set_move(20,20)
      when "pig_invasion"
        @units.create new Lightboar(0,4, "pigboy",0)
        @units.create new Lightboar(3,3, "pigone",0)
        @units.create new Lightboar(2,3, "pigtwo",0)
        @units.create new Lightboar(20,15,"pigthree",0)
        @units.units[1].order = null
        @units.units[2].order = null
        @units.units[3].order = null
        @map.sketch.create_crystal(5,5)
        @map.drop_crystal(5,5)
      when "hand_disability_combat"
        @units.create new Human(10,10, "nofight",0)
        @units.create new Human(10,20, "Target",1)
        @units.units[0].body.hand = 2
        @units.units[0].target = @units.units[1]
      when "hand_disability_gathering"
        @units.create new Human(10,10,"gatherer",0)
        @units.units[0].body.hand = 2
        location = (x: 300, y: 300)
        @map.add_stockpile(location)
      when "full_test_boars"
        @map.sketch.create_crystal(20,20)
        @map.map[20][20].items = 50
        @units.generate_boars()
        @units.create new Human(10,10, "grumpy_killer",0)
      when "pathfinding"
        @units.create new Human(10,10, "pathfinder_one",0)
        @units.create new Human(10,20, "pathfinder_two",0)
        begin = (x: 15, y: 11)
        end = (x: 15, y: 9)
        @map.sketch.draw(begin,end,"wall")
        @units.units[0].set_move(20,10)
        @units.units[0].agility = 25
        top_begin = (x: 13, y: 14)
        top_end = (x: 20, y: 14)
        @map.sketch.draw(top_begin,top_end,"wall")
        bottom_begin = (x: 13, y: 25)
        bottom_end = (x: 20, y: 25)
        @map.sketch.draw(bottom_begin,bottom_end,"wall")
        vertical_begin = (x: 20, y: 15)
        vertical_end = (x: 20, y: 24)
        @map.sketch.draw(vertical_begin,vertical_end,"wall")
        @units.units[1].set_move(25,20)
        @units.units[1].agility = 25
      when "unpathable_1"
        @units.create new Human(10,10, "pathfinder_one",0)
        @map.sketch.create_wall(20,10)
        @units.units[0].set_move(20,10)
        @units.units[0].agility = 25
      when "unpathable_2"
        @map.width = 40
        @map.height = 30
        @map.size_map()
        @units.create new Human(10,10, "pathfinder_one",0)
        begin = (x: 19, y: 9)
        end = (x: 21, y: 9 )
        @map.sketch.draw(begin,end,"wall")
        begin.y = 11
        end.y = 11
        @map.sketch.draw(begin,end,"wall")
        @map.sketch.create_wall(19,10)
        @map.sketch.create_wall(21,10)
        @units.units[0].set_move(20,10)
        @units.units[0].agility = 25
      else
        @units.create new Human(10,10, "Killy",0)
        @units.units[0].stance = 1
        @units.create new Human(12,10, "Cibo",1)
        @units.units[1].stance = 1
