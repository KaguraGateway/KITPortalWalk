class HalfSemester < ApplicationRecord
    has_many :user_subjects, dependent: :destroy

    validates :start_date, presence: true
    validates :end_date, presence: true

    enum :type, [ :spring, :summer, :fall, :winter ]
end