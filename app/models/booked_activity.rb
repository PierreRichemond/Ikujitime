class BookedActivity < ApplicationRecord
  belongs_to :child
  belongs_to :activity
end
