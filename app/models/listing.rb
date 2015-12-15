class Listing < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true
  # validates :body, presence: true
  # validates :start, presence: true
  # validates :end, presence: true
  # validates :num_of_guest, presence: true
  # validates :room_type, presence: true

  mount_uploader :picture, PictureUploader
end
