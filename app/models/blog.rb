class Blog < ApplicationRecord
    has_many :summaries
    has_many :profiles, through: :summaries
end
