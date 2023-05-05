class HalfSemester < ApplicationRecord
    belongs_to :semester
    has_many :user_subjects, dependent: :destroy

    validates :start_date, presence: true
    validates :end_date, presence: true

    enum :season_type, [ :spring, :summer, :fall, :winter ]
end
