class Profile < ApplicationRecord
    has_many :posts
    has_many :summaries
    has_many :blogs, through: :summaries

    has_secure_password

    validates_presence_of :fullname, message: "Can't be blank"
end
