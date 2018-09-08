# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


map = Map.create(description: 'map 1')

polygon1 = Polygon.create(designation: 'a', map: map, vertex_count: 4)
polygon1.vertices.create(x: 220, y: 616)
polygon1.vertices.create(x: 220, y: 666)
polygon1.vertices.create(x: 251, y: 670)
polygon1.vertices.create(x: 272, y: 647)

polygon2 = Polygon.create(designation: 'b', map: map, vertex_count: 4)
polygon2.vertices.create(x: 341, y: 655)
polygon2.vertices.create(x: 359, y: 667)
polygon2.vertices.create(x: 374, y: 651)
polygon2.vertices.create(x: 366, y: 577)

polygon3 = Polygon.create(designation: 'c', map: map, vertex_count: 6)
polygon3.vertices.create(x: 311, y: 530)
polygon3.vertices.create(x: 311, y: 559)
polygon3.vertices.create(x: 339, y: 578)
polygon3.vertices.create(x: 361, y: 560)
polygon3.vertices.create(x: 361, y: 528)
polygon3.vertices.create(x: 336, y: 516)

polygon4 = Polygon.create(designation: 'd', map: map, vertex_count: 5)
polygon4.vertices.create(x: 105, y: 628)
polygon4.vertices.create(x: 151, y: 670)
polygon4.vertices.create(x: 180, y: 629)
polygon4.vertices.create(x: 156, y: 577)
polygon4.vertices.create(x: 113, y: 587)

polygon5 = Polygon.create(designation: 'e', map: map, vertex_count: 4)
polygon5.vertices.create(x: 118, y: 517)
polygon5.vertices.create(x: 245, y: 517)
polygon5.vertices.create(x: 245, y: 577)
polygon5.vertices.create(x: 118, y: 557)

polygon6 = Polygon.create(designation: 'f', map: map, vertex_count: 4)
polygon6.vertices.create(x: 280, y: 583)
polygon6.vertices.create(x: 333, y: 583)
polygon6.vertices.create(x: 333, y: 665)
polygon6.vertices.create(x: 280, y: 665)

polygon7 = Polygon.create(designation: 'g', map: map, vertex_count: 3)
polygon7.vertices.create(x: 252, y: 594)
polygon7.vertices.create(x: 290, y: 562)
polygon7.vertices.create(x: 264, y: 538)

polygon8 = Polygon.create(designation: 'h', map: map, vertex_count: 3)
polygon8.vertices.create(x: 198, y: 635)
polygon8.vertices.create(x: 217, y: 574)
polygon8.vertices.create(x: 182, y: 574)


agent = Agent.create(name: 'agent A', description: 'A-star search algorithm.', algorithm: 'A-star')

execution = Execution.create(map_id: 1,
                             agent_id: 1,
                             agent_current_x: 115,
                             agent_current_y: 655,
                             agent_current_cost: 0,
                             start_point_x: 115,
                             start_point_y: 655,
                             end_point_x: 380,
                             end_point_y: 560)

execution2 = Execution.create(map_id: 1,
                             agent_id: 1,
                             agent_current_x: 110,
                             agent_current_y: 550,
                             agent_current_cost: 0,
                             start_point_x: 110,
                             start_point_y: 550,
                             end_point_x: 385,
                              end_point_y: 600)

execution3 = Execution.create(map_id: 1,
                              agent_id: 1,
                              agent_current_x: 110,
                              agent_current_y: 680,
                              agent_current_cost: 0,
                              start_point_x: 110,
                              start_point_y: 680,
                              end_point_x: 385,
                              end_point_y: 680)

execution4 = Execution.create(map_id: 1,
                              agent_id: 1,
                              agent_current_x: 110,
                              agent_current_y: 505,
                              agent_current_cost: 0,
                              start_point_x: 110,
                              start_point_y: 505,
                              end_point_x: 385,
                              end_point_y: 660)

execution5 = Execution.create(map_id: 1,
                              agent_id: 1,
                              agent_current_x: 110,
                              agent_current_y: 680,
                              agent_current_cost: 0,
                              start_point_x: 110,
                              start_point_y: 680,
                              end_point_x: 385,
                              end_point_y: 505)


map2 = Map.create(description: 'map 2')

polygon1 = Polygon.create(designation: 'a', map: map2, vertex_count: 4)
polygon1.vertices.create(x: 150, y: 520)
polygon1.vertices.create(x: 150, y: 680)
polygon1.vertices.create(x: 170, y: 600)
polygon1.vertices.create(x: 160, y: 600)

polygon2 = Polygon.create(designation: 'b', map: map2, vertex_count: 4)
polygon2.vertices.create(x: 150, y: 500)
polygon2.vertices.create(x: 190, y: 500)
polygon2.vertices.create(x: 190, y: 600)
polygon2.vertices.create(x: 170, y: 520)

polygon3 = Polygon.create(designation: 'c', map: map2, vertex_count: 6)
polygon3.vertices.create(x: 311, y: 530)
polygon3.vertices.create(x: 311, y: 559)
polygon3.vertices.create(x: 339, y: 578)
polygon3.vertices.create(x: 361, y: 560)
polygon3.vertices.create(x: 361, y: 528)
polygon3.vertices.create(x: 336, y: 516)

polygon4 = Polygon.create(designation: 'd', map: map2, vertex_count: 5)
polygon4.vertices.create(x: 205, y: 628)
polygon4.vertices.create(x: 251, y: 670)
polygon4.vertices.create(x: 280, y: 629)
polygon4.vertices.create(x: 256, y: 577)
polygon4.vertices.create(x: 213, y: 587)

polygon5 = Polygon.create(designation: 'e', map: map2, vertex_count: 4)
polygon5.vertices.create(x: 218, y: 517)
polygon5.vertices.create(x: 345, y: 517)
polygon5.vertices.create(x: 345, y: 577)
polygon5.vertices.create(x: 218, y: 557)

polygon6 = Polygon.create(designation: 'f', map: map2, vertex_count: 4)
polygon6.vertices.create(x: 280, y: 583)
polygon6.vertices.create(x: 333, y: 583)
polygon6.vertices.create(x: 333, y: 665)
polygon6.vertices.create(x: 280, y: 665)

polygon7 = Polygon.create(designation: 'g', map: map2, vertex_count: 3)
polygon7.vertices.create(x: 252, y: 594)
polygon7.vertices.create(x: 290, y: 562)
polygon7.vertices.create(x: 264, y: 538)

polygon8 = Polygon.create(designation: 'h', map: map2, vertex_count: 3)
polygon8.vertices.create(x: 398, y: 635)
polygon8.vertices.create(x: 317, y: 574)
polygon8.vertices.create(x: 382, y: 574)


execution6 = Execution.create(map_id: 2,
                              agent_id: 1,
                              agent_current_x: 110,
                              agent_current_y: 600,
                              agent_current_cost: 0,
                              start_point_x: 110,
                              start_point_y: 600,
                              end_point_x: 390,
                              end_point_y: 600)