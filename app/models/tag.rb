class Tag < ApplicationRecord
    has_and_belongs_to_many :projects, dependent: :destroy
end
