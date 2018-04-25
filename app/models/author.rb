class Author < ActiveRecord::Base
  validates :name, presence: true
  validates :name, length: { is: 6 }
end
