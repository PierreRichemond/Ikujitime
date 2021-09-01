class Child < ApplicationRecord
  require "date"
  belongs_to :user
  has_many :events, dependent: :destroy
  has_many :gifts, through: :events
  has_many :activities, through: :events
  has_one_attached :photo
  acts_as_taggable_on :tags

  validates :birthday, presence: true
  validates :first_name, presence: true

  def age(child)
    Date.today.year - child.birthday.year
  end

  def full_name(child)
    "#{child.first_name.capitalize} #{child.middle_name.capitalize} #{child.last_name.capitalize}"
  end
end
