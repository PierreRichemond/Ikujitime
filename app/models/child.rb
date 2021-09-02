class Child < ApplicationRecord
  include ActionView::Helpers::TextHelper
  require "date"
  belongs_to :user
  has_many :events, dependent: :destroy
  has_many :gifts, through: :events
  has_many :activities, through: :events
  has_one_attached :photo
  acts_as_taggable_on :tags
  TAGS = [ "Indoor", "Outdoor", "Sports", "Sightseeing", "Food&Drink" ]

  validates :birthday, presence: true
  validates :first_name, presence: true

  def age
    days = (Date.today - birthday).to_i
    if (days - 365).negative?
      months = days / 30
      "#{pluralize(months, 'month')}"
    elsif (days - 1095).negative? #less than 3years old
      years = days / 365
      remains = days % 365
      months = remains / 30
      "#{pluralize(years, 'year')}, #{pluralize(months, 'month')}"
    else
      years = days / 365
      "#{pluralize(years, 'year')}"
    end
  end

  def full_name
    "#{first_name.capitalize} #{middle_name.capitalize} #{last_name.capitalize}"
  end
end
