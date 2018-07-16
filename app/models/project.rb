class Project < ApplicationRecord
    belongs_to :admin, class_name: "User"
    has_and_belongs_to_many :members, class_name: "User", foreign_key: :user_id
    has_many :likes
    has_many :liking_users, through: :likes, source: :user
    has_and_belongs_to_many :tags
end
