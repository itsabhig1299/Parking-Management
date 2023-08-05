class Ticket < ApplicationRecord

  attr_accessor :parking

  belongs_to :spot
  belongs_to :car
end
