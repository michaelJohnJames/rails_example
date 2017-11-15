class Employee < ApplicationRecord
  validates :name, :title, presence: true
end
