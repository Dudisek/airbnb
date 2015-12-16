class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :bookings
  validates :name, presence: true

  has_many :listing_tags
  has_many :tags, through: :listing_tags
  # validates :body, presence: true
  # validates :start, presence: true
  # validates :end, presence: true
  # validates :num_of_guest, presence: true
  # validates :room_type, presence: true

  mount_uploaders :picture, PictureUploader
end
