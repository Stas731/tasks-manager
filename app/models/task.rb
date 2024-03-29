class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :task_tags
  has_many :tags, through: :task_tags
  has_many :comments
end
