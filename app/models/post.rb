class Post < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 1000}
  validates :title, presence: true, length: {maximum: 70}

  default_scope -> { order('created_at DESC') }
end
