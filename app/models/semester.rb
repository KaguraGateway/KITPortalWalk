class Semester < ApplicationRecord
    has_many :user_subjects, dependent: :destroy
    has_many :half_semesters, dependent: :destroy

    validates :year, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true

    enum :gakki, { first: 1, second: 2 }
end
