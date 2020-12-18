class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true, length: {minimum: 2, maximum: 20 }
  validates :introduction, length: {maximum: 50 }

  has_many :books,dependent: :destroy
  has_many :book_comment,dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :followed_relationships,foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followed, through: :followed_relationships

  has_many :follower_relationships,foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships

  attachment :profile_image


  def followed?(other_user)
    self.followed.include?(other_user)
  end

  def follow!(other_user)
    followed_relationships.create!(followed_id: other_user.id)
  end

  def unfollow(other_user)
    followed_relationships.find_by(followed_id: other_user.id).destroy
  end

end
