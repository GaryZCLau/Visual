class Profile < ApplicationRecord
    has_many :posts
    has_many :summaries
    has_many :blogs, through: :summaries

    validates_presence_of :fullname, message: "Name can't be blank"
end
