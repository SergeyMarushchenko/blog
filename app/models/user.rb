class User < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 50, minimum: 2}

  VALID_EMAIL_FORMAT = /\A[a-z]+@[a-z]+\.[a-z]+\Z/i
  validates :email, presence: true, 
                    format: {with: VALID_EMAIL_FORMAT}, 
                    uniqueness: {case_sensitive: false}

  before_save {self.email = email.downcase}

  has_secure_password
  validates :password, length: {minimum: 6}
end
