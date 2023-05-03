class SubjectGroup < ApplicationRecord
    belongs_to :subject_categories
    has_many :user_subjects, dependent: :destroy

    validates :title, presence: true
    validates :min_credit, presence: true
end
