class RequiredCourse < ApplicationRecord
    has_many :required_subject_categories, dependent: :destroy

    validates :title, presence: true
end
