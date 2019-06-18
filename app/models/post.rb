class Post < ActiveRecord::Base
  # 1. Add validations to `Post` such that...
  #   1. The title cannot be blank
  validates :title, presence: true
  validates :category, inclusion: { in:%w(Fiction Non-Fiction) }
  validates :content, length: { minimum:100 }
  # validates :category, inclusion: { in:%w(Fiction ,Non-Fiction) }
  # validates :category, length: { maximum: 500 }

end
