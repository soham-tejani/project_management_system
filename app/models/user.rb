class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects, dependent: :destroy
  has_many :comments, foreign_key: :author_id, dependent: :destroy
  has_many :status_changes, foreign_key: :actor_id, dependent: :destroy

  validates :name, presence: true
end
