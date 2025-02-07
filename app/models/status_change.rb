class StatusChange < ApplicationRecord
  belongs_to :project
  belongs_to :actor, class_name: "User", foreign_key: :user_id


  enum status: { pending: 0, in_progress: 1, completed: 2 }
end
