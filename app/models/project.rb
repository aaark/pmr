# Project model
class Project < ApplicationRecord
  has_many :project_developers
  belongs_to :manager, class_name: 'User', foreign_key: 'manager_id'
  has_many :developers, through: :project_developers, class_name: 'User', foreign_key: 'user_id'
end
