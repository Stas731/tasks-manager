class Category < ApplicationRecord
    has_many :tasks, dependent: :nullify
end
