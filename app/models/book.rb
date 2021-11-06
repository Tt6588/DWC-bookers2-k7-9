class Book < ApplicationRecord
  
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 } 
  
  scope :created_today, -> { where(created_at: Time.zone.now.all_day) }
  scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day) }
  scope :created_toweek, -> { where(created_at: Date.today.all_week) }
  scope :created_lastweek, -> { where(created_at: 1.week.ago.all_day) }
  
  
end
