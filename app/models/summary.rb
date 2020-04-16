class Summary < ApplicationRecord
    belongs_to :profile
    belongs_to :blog

    validates :fullname , presence: true
end
