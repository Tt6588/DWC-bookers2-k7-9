class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         
  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  
  has_many :reverse_of_relation_ships, class: "RelationShip", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower
  # 被フォロー関係を通じて参照→followed_idをフォローしている人
  
  has_many :relation_ships, class: "RelationShip", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  # 与フォロー関係を通じて参照→follower_idをフォローしている人
  
  attachment :profile_image
  
  
  validates :name, uniqueness: true, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 } 
  
  
end
