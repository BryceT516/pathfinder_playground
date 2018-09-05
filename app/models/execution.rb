class Execution < ApplicationRecord
  belongs_to :agent
  belongs_to :map

  has_many :frontier_points
  has_many :visited_points

  def clear_frontier
    frontier_points.each do |point|
      point.destroy
    end
  end

  def visited_point?(point)
    visited_points.find_by(x: point[:x], y: point[:y]).present?
  end
end