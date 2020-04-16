class Summary < ApplicationRecord
    belongs_to :profile
    belongs_to :blog

    validates_presence_of :summary, message: "Can't be blank"
end
