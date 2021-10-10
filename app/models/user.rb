class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  #自分がフォローする側の関係性
  has_many :active_relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
  #自分がフォローしている人を見たい（active_relationshipsを通じてRelationshipテーブルを参照）
  has_many :followings, through: :active_relationships, source: :followed
  #自分がフォローされる側の関係性
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :following

  def follow(another_user)
    active_relationships.create(followed_id: another_user.id)
  end

  def unfollow(another_user)
    active_relationships.find_by(followed_id: another_user).destroy
  end

  def following?(user_id)
    followings.include?(user_id)
  end

  attachment :profile_image, destroy: false

  validates :name, uniqueness: true, length: { in: 2..50 }
  validates :introduction, length: { maximum: 50 }
end
