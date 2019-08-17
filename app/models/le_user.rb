class LeUser < ApplicationRecord
    validates :username, presence: true
end
