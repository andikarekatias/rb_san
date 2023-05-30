class Comment < ApplicationRecord
  belongs_to :notice
  belongs_to :user
  has_rich_text :body
end
