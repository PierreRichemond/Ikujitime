class PurchasedGift < ApplicationRecord
  belongs_to :gift
  belongs_to :child
  has_many_attached :photos
end
