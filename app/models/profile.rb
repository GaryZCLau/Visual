class Profile < ApplicationRecord
    has_many :posts
    has_many :summaries
    has_many :blogs, through: :summaries
end
