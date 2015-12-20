class Listing < ActiveRecord::Base

  belongs_to :user
  has_many :bookings
  validates :name, presence: true
  has_address :address
  acts_as_taggable_on :tags
 
  after_validation :geocode
  geocoded_by :address_formatted_address, :latitude  => :address_lat, :longitude => :address_lng



  # after_validation :geocode, :if => :address_formatted_address_changed?

  # validates :body, presence: true
  # validates :start, presence: true
  # validates :end, presence: true
  # validates :num_of_guest, presence: true
  # validates :room_type, presence: true

  mount_uploaders :picture, PictureUploader
end
