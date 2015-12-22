class User < ActiveRecord::Base

  include Clearance::User
  
  # ASSOCIATIONS

  has_many :authentications, :dependent => :destroy
  has_many :listings
  has_many :bookings
  has_many :transactions, foreign_key: :user_id

  mount_uploader :picture, PictureUploader

  # VALIDATION

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :birthday, presence: true
  validates :phone, presence: true

  # METHODS
  
  def self.create_with_auth_and_hash(authentication,auth_hash)
    create! do |u|
      u.first_name = auth_hash["info"]["name"]
      u.picture = auth_hash["info"]["image"]         
      u.email = auth_hash["extra"]["raw_info"]["email"]
      u.authentications<<(authentication)
    end
  end

  
  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end
  
  
  def password_optional?
    true
  end

end