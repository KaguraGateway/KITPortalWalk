class CourseCategory < ApplicationRecord
    belongs_to :admission_year
    has_many :subject_categories, dependent: :destroy

    validates :title, presence: true
end
