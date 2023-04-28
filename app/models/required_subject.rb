class RequiredSubject < ApplicationRecord
    belongs_to :required_subject_category
    has_many :user_subjects, dependent: :destroy

    validates :title, presence: true
    validates :min_credit, presence: true
end
