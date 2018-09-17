class DayDatum < ApplicationRecord
  validates :id, {uniqueness: true}
end
