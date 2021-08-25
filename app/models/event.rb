class Event < ApplicationRecord
  belongs_to :child
  belongs_to :activity, optional: true
  belongs_to :gift, optional: true
  has_many_attached :photos

end
