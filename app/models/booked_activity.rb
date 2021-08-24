class BookedActivity < ApplicationRecord
  belongs_to :child
  belongs_to :activity
  has_many_attached :photos
end
