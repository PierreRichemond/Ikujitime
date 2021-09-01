class Activity < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :events
  has_one_attached :photo

  # include PgSearch::Model
  # pg_search_scope :search_activities,
  #   against: [ :name, :address ],
  #   using: {
  #     tsearch: { prefix: true } # <-- now `superman batm` will return something!
  #   }
  # method to define a marker for each location
  # def marker
  #   {
  #   lat: latitude,
  #   lng: longitude,
  #   info_window: ApplicationController.new.render_to_string(partial: "map_components/info_window", locals: { activity: self })
  #   }
  # end
end
