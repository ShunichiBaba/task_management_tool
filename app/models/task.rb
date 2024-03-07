class Task < ApplicationRecord
    belongs_to :member
    has_one :team, through: :member
end
