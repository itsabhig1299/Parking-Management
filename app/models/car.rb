class Car < ApplicationRecord
	has_many :tickets 
	has_many :spots, through: :tickets

	validates :color, presence: true
	validates :registration_number, presence: true, uniqueness: true

	scope :not_in_parking, -> {includes(:spots).where(spots: {occupied: [false, nil ]})}
end
