class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validates :title, presence: true if :not_clickbait

  def not_clickbait
    return self.title
    if self.title.include? "Won't Believe"
      return false
    elsif self.title.include? "Secret"
      return false
    elsif self.title.include? "Guess"
      return false
    elsif self.title.include? "Top"
      return false
    else
      return true
    end
  end
end
