class Polygon < ApplicationRecord
  belongs_to :map
  has_many :vertices

end
