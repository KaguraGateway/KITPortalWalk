class Classroom < ApplicationRecord
    belongs_to :building
    has_many :user_subjects, dependent: :destroy

    validates :name, presence: true
end
