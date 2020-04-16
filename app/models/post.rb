class Post < ApplicationRecord
    belongs_to :profile

    validates :post , presence: true
end
