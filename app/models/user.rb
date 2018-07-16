class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # user-project
  has_many :my_projects, class_name: "Project", foreign_key: :project_id
  has_and_belongs_to_many :our_projects, class_name: "Project", foreign_key: :project_id

  # likes
  has_many :likes
  has_many :liked_projects, through: :likes, source: :project

  # requests
  has_many :requester_requests, class_name: :"Request", foreign_key: :requestee_id
  has_many :requesters, through: :requester_requests, source: :requester

  has_many :requestee_requests, class_name: :"Request", foreign_key: :requester_id
  has_many :requestees, through: :requestee_requests, source: :requestee
end
