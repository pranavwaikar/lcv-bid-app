class Vehicle < ApplicationRecord
  belongs_to :lcvowner
  has_many :serviceareas
end
