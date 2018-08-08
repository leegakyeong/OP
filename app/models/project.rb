class Project < ActiveRecord::Base
    belongs_to :admin, class_name: "User"
    # has_and_belongs_to_many :members, class_name: "User", foreign_key: :user_id

    # likes
    has_many :project_likes
    has_many :liking_users, through: :project_likes, source: :user

    # tags
    has_and_belongs_to_many :tags, dependent: :destroy

    # request
    has_many :applications
    has_many :appliers, through: :applications, source: :user, dependent: :destroy

    # membership
    has_many :memberships
    has_many :members, through: :memberships, source: :user, dependent: :destroy

    has_attached_file :reference
    do_not_validate_attachment_file_type :reference

    scope :search_keyword, -> (keyword) { joins(:tags).where("content LIKE ? ", "%#{keyword}%") or where('title LIKE ? OR description LIKE ?', "%#{keyword}%", "%#{keyword}%")  }
end
