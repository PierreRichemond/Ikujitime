class Gift < ApplicationRecord
  has_many :purchased_gifts
  has_one_attached :photo
end
