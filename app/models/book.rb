class Book < ApplicationRecord
  
  belongs_to :user
  
  def index
    @book = book.new
  end
  
  
end
