class Project < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :status_changes, dependent: :destroy

  accepts_nested_attributes_for :comments, allow_destroy: false
  accepts_nested_attributes_for :status_changes, allow_destroy: false
end
