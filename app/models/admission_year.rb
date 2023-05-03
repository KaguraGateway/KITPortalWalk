class AdmissionYear < ApplicationRecord
    has_many :course_categories, dependent: :destroy

    validates :year, presence: true
end
