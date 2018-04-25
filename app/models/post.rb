class MyValidator < ActiveModel::Validator
  def validate(record)
    if self.title.include? "Won't Believe"
      record.errors[:title] << 'clickbait-y'
    elsif self.title.include? "Secret"
      record.errors[:title] << 'clickbait-y'
    elsif self.title.include? "Guess"
      record.errors[:title] << 'clickbait-y'
    elsif self.title.include? "Top"
      record.errors[:title] << 'clickbait-y'
    else
    end
  end
end

class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with MyValidator
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  # validates :title, presence: true if :not_clickbait

  # def not_clickbait
  #   return self.title
  #   if self.title.include? "Won't Believe"
  #     return false
  #   elsif self.title.include? "Secret"
  #     return false
  #   elsif self.title.include? "Guess"
  #     return false
  #   elsif self.title.include? "Top"
  #     return false
  #   else
  #     return true
  #   end
end
