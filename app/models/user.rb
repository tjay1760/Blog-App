class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  validates :name, presence: true
  after_create :recent_posts

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
