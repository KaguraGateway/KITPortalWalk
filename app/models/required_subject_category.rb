class RequiredSubjectCategory < ApplicationRecord
    belongs_to :required_course
    has_many :required_subjects, dependent: :destroy

    validates :title, presence: true
end
