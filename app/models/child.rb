class Child < ApplicationRecord
  include ActionView::Helpers::TextHelper
  require "date"
  belongs_to :user
  has_many :events, dependent: :destroy
  has_many :gifts, through: :events
  has_many :activities, through: :events
  has_one_attached :photo


  validates :birthday, presence: true
  validates :first_name, presence: true

  def age
    days = (Date.today - birthday).to_i
    if (days - 365).negative?
      months = days / 30
      "#{pluralize(months, 'month')} old."
    else
      years = days / 365
      remains = days % 365
      months = remains / 30
      "#{pluralize(years, 'year')}, #{pluralize(months, 'month')} old."
    end
  end

  def full_name
    "#{first_name.capitalize} #{middle_name.capitalize} #{last_name.capitalize}"
  end
end
