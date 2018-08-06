class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # user-project
  has_many :my_projects, class_name: "Project", foreign_key: :project_id
  # has_and_belongs_to_many :our_projects, class_name: "Project", foreign_key: :project_id

  # likes
  has_many :likes
  has_many :liked_projects, through: :likes, source: :project

  # requests
  has_many :applications
  has_many :applying_projects, through: :applications, source: :project, dependent: :destroy

  # membership
  has_many :memberships
  has_many :participating_projects, through: :memberships, source: :project, dependent: :destroy

  #has_attached_file :reference
end
