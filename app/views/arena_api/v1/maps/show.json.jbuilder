json.id @map.id
json.description @map.description
json.width @map.width
json.height @map.height
json.polygons @map.polygons do |polygon|
  json.designation polygon.designation
  json.vertex_count polygon.vertex_count
  json.vertices polygon.vertices do |vertex|
    json.x vertex.x
    json.y vertex.y
  end
end
