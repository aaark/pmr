# Project model
class Project < ApplicationRecord
  has_many :project_developers
  belongs_to :manager, class_name: 'User', foreign_key: 'manager_id', optional: true
  has_many :developers, through: :project_developers, class_name: 'User', foreign_key: 'user_id'
  
  enum project_type: { web_development: 0, mobile_app: 1, qa: 3}
end
