class Child < ApplicationRecord
  require "date"
  belongs_to :user
  has_many :events
  has_many :gifts, through: :events
  has_many :activities, through: :events
  GENDERS = ["male", "female", "others"]


  validates :birthday, presence: true
  validates :first_name, presence: true
  validates :gender, presence: true, inclusion: { in: GENDERS }

  def age
    Date.today.year - child.birthday.year
  end

  def full_name
    "#{child.first.capitalize} #{child.middle_name.capitalize} #{child.last_name.capitalize}"
  end
end
