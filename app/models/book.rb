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
  scope :created_toweek, -> { where(created_at: 6.day.ago.beginning_of_day..Time.zone.now.end_of_day) }
  scope :created_lastweek, -> { where(created_at: 2.week.ago.beginning_of_day..1.week.ago.end_of_day) }
  
  scope :created_day2, -> { where(created_at: 2.day.ago.all_day) }
  scope :created_day3, -> { where(created_at: 3.day.ago.all_day) }
  scope :created_day4, -> { where(created_at: 4.day.ago.all_day) }
  scope :created_day5, -> { where(created_at: 5.day.ago.all_day) }
  scope :created_day6, -> { where(created_at: 6.day.ago.all_day) }
  
  
end
