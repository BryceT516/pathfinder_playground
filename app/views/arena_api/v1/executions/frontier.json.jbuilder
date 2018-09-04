json.array!(@frontier_points) do |vertex|
  json.x vertex[:x]
  json.y vertex[:y]
end