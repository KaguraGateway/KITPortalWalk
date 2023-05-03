class RequiredCourse < ApplicationRecord
    belongs_to :require_admission_year
    has_many :required_subject_categories, dependent: :destroy

    validates :title, presence: true
end
