class Project < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :client, presence: true
end
