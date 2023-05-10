class HalfSemester < ApplicationRecord
    belongs_to :semester
    has_many :user_subjects, dependent: :destroy

    validates :start_date, presence: true
    validates :end_date, presence: true

    enum :season_type, [ :spring, :summer, :fall, :winter ]

    scope :by_date, -> (date) { where("start_date <= ? AND end_date >= ?", date, date).first }
    scope :current, -> { by_date(Date.today) }
end
