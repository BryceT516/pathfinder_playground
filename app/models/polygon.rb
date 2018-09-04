class Polygon < ApplicationRecord
  belongs_to :map
  has_many :vertices


  def check_intersection(origin_x:, origin_y:, end_x:, end_y:)
    return true if line_internal_to_polygon?(origin_x: origin_x, origin_y: origin_y, end_x: end_x, end_y: end_y)

    p1x = origin_x
    p1y = origin_y
    p2x = end_x
    p2y = end_y

    vertices.each_with_index do |vertex, index|
      q1x = vertex.x
      q1y = vertex.y

      next_vertex = get_next_vertex(index)
      q2x = next_vertex.x
      q2y = next_vertex.y

      k1 = p1x - p2x
      k2 = q2y - q1y
      k3 = p1y - p2y
      k4 = q2x - q1x
      k5 = p1x - q1x
      k6 = p1y - q1y

      d = (k1 * k2) - (k3 * k4)

      if d == 0
        next
      end

      a = (((k2 * k5) - (k4 * k6)).to_f / d)
      b = (((k1 * k6) - (k3 * k5)).to_f / d)

      if between_zero_and_one(a) && between_zero_and_one(b)
        return true
      end
    end

    false
  end

  def get_visible_vertices(x:, y:)
    vertices_list = []

    vertices.each do |vertex|
      vertices_list << {x: vertex.x, y: vertex.y} unless check_intersection(origin_x: x, origin_y: y, end_x: vertex.x, end_y: vertex.y)
    end

    vertices_list
  end

  private

  def get_next_vertex(current_vertex_index)
    if current_vertex_index + 1 == vertices.count
      return vertices.first
    else
      return vertices[current_vertex_index + 1]
    end
  end

  def between_zero_and_one(value)
    value > 0 && value < 1
  end

  def line_internal_to_polygon?(origin_x:, origin_y:, end_x:, end_y:)
    start_vertex = point_is_a_vertex?(origin_x, origin_y)

    unless start_vertex == -1
      return point_is_nonadjacent_vertex?(start_vertex, end_x, end_y)
    end

    false
  end

  def point_is_a_vertex?(x, y)
    vertices.each_with_index do |value, index|
      return index if value.x == x && value.y == y
    end
    return -1
  end

  def point_is_nonadjacent_vertex?(vertex_index, x, y)
    end_point_vertex = point_is_a_vertex?(x, y)
    return false if end_point_vertex == -1

    left_vertex = get_next_index_left(vertex_index)
    right_vertex = get_next_index_right(vertex_index)

    return false if end_point_vertex == left_vertex || end_point_vertex == right_vertex

    true
  end

  def get_next_index_left(current_index)
    if current_index == 0
      return vertices.count - 1
    else
      return current_index - 1
    end
  end

  def get_next_index_right(current_index)
    if current_index + 1 == vertices.count
      return 0
    else
      return current_index + 1
    end
  end

end
