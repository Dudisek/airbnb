class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :bookings
  validates :name, presence: true

  # attr_accessible :tag_list
  acts_as_taggable_on :tags

  # validates :body, presence: true
  # validates :start, presence: true
  # validates :end, presence: true
  # validates :num_of_guest, presence: true
  # validates :room_type, presence: true

  mount_uploaders :picture, PictureUploader
end
