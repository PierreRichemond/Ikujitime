class Child < ApplicationRecord
  belongs_to :user
  has_many :purchased_gifts
  has_many :gifts, through: :purchased_gifts
  has_many :booked_activities
  has_many :activities, through: :booked_activities


  validates :age, presence: true
  validates :first_name, presence: true
  validates :gender, presence: true
end
