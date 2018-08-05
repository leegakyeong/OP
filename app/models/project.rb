class Project < ActiveRecord::Base
    belongs_to :admin, class_name: "User"
    # has_and_belongs_to_many :members, class_name: "User", foreign_key: :user_id

    # likes
    has_many :likes
    has_many :liking_users, through: :likes, source: :user, dependent: :destroy

    # tags
    has_and_belongs_to_many :tags, dependent: :destroy

    # request
    has_many :applications
    has_many :appliers, through: :applications, source: :user, dependent: :destroy

    # membership
    has_many :memberships
    has_many :members, through: :memberships, source: :user, dependent: :destroy

    has_attached_file :reference
end
