class Profile < ApplicationRecord
    has_many :posts
    has_many :summaries
    has_many :blogs, through: :summaries

    validates :fullname , presence: true
end
