# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


map = Map.create(description: 'map 1', start_point_x: 115, start_point_y: 655, end_point_x: 380, end_point_y: 560)

polygon1 = Polygon.create(designation: 'a', map: map, vertex_count: 4)
Vertex.create(polygon: polygon1, x: 220, y: 616)
Vertex.create(polygon: polygon1, x: 220, y: 666)
Vertex.create(polygon: polygon1, x: 251, y: 670)
Vertex.create(polygon: polygon1, x: 272, y: 647)

polygon2 = Polygon.create(designation: 'b', map: map, vertex_count: 4)
Vertex.create(polygon: polygon2, x: 341, y: 655)
Vertex.create(polygon: polygon2, x: 359, y: 667)
Vertex.create(polygon: polygon2, x: 374, y: 651)
Vertex.create(polygon: polygon2, x: 366, y: 577)

polygon3 = Polygon.create(designation: 'c', map: map, vertex_count: 6)
Vertex.create(polygon: polygon3, x: 311, y: 530)
Vertex.create(polygon: polygon3, x: 311, y: 559)
Vertex.create(polygon: polygon3, x: 339, y: 578)
Vertex.create(polygon: polygon3, x: 361, y: 560)
Vertex.create(polygon: polygon3, x: 361, y: 528)
Vertex.create(polygon: polygon3, x: 336, y: 516)

polygon4 = Polygon.create(designation: 'd', map: map, vertex_count: 5)
Vertex.create(polygon: polygon4, x: 105, y: 628)
Vertex.create(polygon: polygon4, x: 151, y: 670)
Vertex.create(polygon: polygon4, x: 180, y: 629)
Vertex.create(polygon: polygon4, x: 156, y: 577)
Vertex.create(polygon: polygon4, x: 113, y: 587)

polygon5 = Polygon.create(designation: 'e', map: map, vertex_count: 4)
Vertex.create(polygon: polygon5, x: 118, y: 517)
Vertex.create(polygon: polygon5, x: 245, y: 517)
Vertex.create(polygon: polygon5, x: 245, y: 577)
Vertex.create(polygon: polygon5, x: 118, y: 557)

polygon6 = Polygon.create(designation: 'f', map: map, vertex_count: 4)
Vertex.create(polygon: polygon6, x: 280, y: 583)
Vertex.create(polygon: polygon6, x: 333, y: 583)
Vertex.create(polygon: polygon6, x: 333, y: 665)
Vertex.create(polygon: polygon6, x: 280, y: 665)

polygon7 = Polygon.create(designation: 'g', map: map, vertex_count: 3)
Vertex.create(polygon: polygon7, x: 252, y: 594)
Vertex.create(polygon: polygon7, x: 290, y: 562)
Vertex.create(polygon: polygon7, x: 264, y: 538)

polygon8 = Polygon.create(designation: 'h', map: map, vertex_count: 3)
Vertex.create(polygon: polygon8, x: 198, y: 635)
Vertex.create(polygon: polygon8, x: 217, y: 574)
Vertex.create(polygon: polygon8, x: 182, y: 574)


agent = Agent.create(name: 'agent A', description: 'A-star search algorithm.', algorithm: 'A-star')

execution = Execution.create(map_id: 1, agent_id: 1, agent_current_x: map.start_point_x, agent_current_y: map.start_point_y)
