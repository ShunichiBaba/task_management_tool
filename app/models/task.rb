class Task < ApplicationRecord
    belongs_to :member
    belongs_to :team
    belongs_to :status
end
