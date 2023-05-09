class Classroom < ApplicationRecord
    belongs_to :building
    has_many :user_subjects, dependent: :destroy

    validates :room_number, presence: true, uniqueness: { scope: :building_id }
end
