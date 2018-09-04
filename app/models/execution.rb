class Execution < ApplicationRecord
  belongs_to :agent
  belongs_to :map

  has_many :frontier_points
end