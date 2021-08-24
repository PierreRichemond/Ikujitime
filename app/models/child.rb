class Child < ApplicationRecord
  require "date"
  belongs_to :user
  has_many :purchased_gifts
  has_many :gifts, through: :purchased_gifts
  has_many :booked_activities
  has_many :activities, through: :booked_activities


  validates :age, presence: true
  validates :first_name, presence: true
  validates :gender, presence: true

  def age
    Date.today.year - child.birthday.year
  end

  def full_name
    "#{child.first.capitalize} #{child.middle_name.capitalize} #{child.last_name.capitalize}"
  end
end
