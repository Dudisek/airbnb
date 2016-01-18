class Booking < ActiveRecord::Base
	belongs_to :user
	belongs_to :listing

	validates :check_in, presence: true
  validates :check_out, presence: true	
  validates :amount, presence: true
end
