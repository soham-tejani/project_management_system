class Comment < ApplicationRecord
  belongs_to :project
  belongs_to :author, class_name: "User", foreign_key: :user_id

  validates :content, presence: true
end
