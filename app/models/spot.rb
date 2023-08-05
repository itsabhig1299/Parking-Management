class Spot < ApplicationRecord
  belongs_to :parking
  has_many :tickets
  has_many :cars, through: :tickets

  validates_uniqueness_of :name, scope: :parking_id
  validates :nearest_entry, presence: true

  scope :nearest_unoccupied, -> (parking_id) {where(parking_id: parking_id, occupied: false)}
end
