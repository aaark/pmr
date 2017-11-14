# User
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :project_developers
  has_many :projects, through: :project_developers

  enum role: { admin: 0, developer: 1 }
end
