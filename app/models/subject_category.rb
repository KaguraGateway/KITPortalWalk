class SubjectCategory < ApplicationRecord
    belongs_to :course_category
    has_many :subject_groups, dependent: :destroy

    validates :title, presence: true
end
