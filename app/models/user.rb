class User < ApplicationRecord
	has_secure_password
	validates :name, presence: true
	validates :email, presence: true, uniqueness: true
	validates :email, format: { with: /\A\S*@\S*\W\S*\z/, message: "must be a valid email"}
	validates :password, presence: true
	validates :password, format: { with: /\A\S{6,}\z/, message: "is too short (minimum is 6 characters)"}
	validates :password, format: { with: /\A\S{,20}\z/, message: "is too long (maximum is 20 characters)"}
	validates :password_confirmation, presence: true 
	validates_confirmation_of :password
	has_many :words, dependent: :destroy

  before_save :encrypt_password
  
  
  def self.authenticate(email, password)
    user = find_by(email: email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

end
