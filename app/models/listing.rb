class Listing < ActiveRecord::Base

  belongs_to :user
  has_many :bookings
  has_address :address

  acts_as_taggable_on :tags
  geocoded_by :address_formatted_address, latitude: :address_lat, longitude: :address_lng
  searchkick text_middle: [:name, :address_formatted_address]
  mount_uploaders :picture, PictureUploader

  validates :name, presence: true
  validates :body, presence: true
  validates :start, presence: true
  validates :end, presence: true
  validates :num_of_guest, presence: true
  validates :room_type, presence: true

  after_validation :geocode
  
end
