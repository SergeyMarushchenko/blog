class User < ActiveRecord::Base

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_attached_file :avatar, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>", small: "50x50>" }, default_url: "missing.gif"

  validates_attachment :avatar, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }


  validates :name, presence: true, length: {maximum: 50, minimum: 2}

  VALID_EMAIL_FORMAT = /\A[a-z]+@[a-z]+\.[a-z]+\Z/i
  validates :email, presence: true, 
                    format: {with: VALID_EMAIL_FORMAT}, 
                    uniqueness: {case_sensitive: false}

  before_save {self.email.downcase!}

  has_secure_password
  validates :password, length: {minimum: 6}

  before_create :create_remember_token

  def feed
    Post.where("user_id = ?", id)
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  private

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end


end
