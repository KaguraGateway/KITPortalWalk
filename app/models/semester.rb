class Semester < ApplicationRecord
    has_many :user_subjects, dependent: :destroy
    has_many :half_semesters, dependent: :destroy

    validates :year, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true

    enum :gakki, { first_gakki: 1, second_gakki: 2 }

    scope :by_date, -> (date) { where("start_date <= ? AND end_date >= ?", date, date).first }
    scope :current, -> { by_date(Date.today) }
end
