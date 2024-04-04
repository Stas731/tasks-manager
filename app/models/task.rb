class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  has_many :task_tags, dependent: :destroy
  has_many :tags, through: :task_tags
  has_many :comments, dependent: :destroy
end
