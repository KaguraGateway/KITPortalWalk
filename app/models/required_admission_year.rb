class RequiredAdmissionYear < ApplicationRecord
    has_many :required_courses, dependent: :destroy

    validates :year, presence: true
end
