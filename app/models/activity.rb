class Activity < ApplicationRecord
  has_many :booked_activities
  has_one_attached :photo
end
