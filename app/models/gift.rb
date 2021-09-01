class Gift < ApplicationRecord
  has_many :events
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_gifts,
    against: [ :name, :description, :start_age, :end_age ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
