class PurchasedGift < ApplicationRecord
  belongs_to :gift
  belongs_to :child
end
