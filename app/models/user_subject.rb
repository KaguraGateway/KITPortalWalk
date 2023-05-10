class UserSubject < ApplicationRecord
    belongs_to :user
    belongs_to :classroom
    belongs_to :class_schedule
    belongs_to :semester
    belongs_to :half_semester, optional: true
    belongs_to :subject_group

    validates :subject_name, presence: true
    validates :credits, numericality: { in: 0..4 }
    validates :user, presence: true
    validates :class_schedule, presence: true
    validates :semester, presence: true
    validates :subject_group, presence: true

    enum :grade, [ :S, :A, :B, :C, :D, :F ]
    enum :day, [ :Mon, :Tue, :Wed, :Thu, :Fri, :Sat, :Sun ]

    # GPAでの評価ポイント
    $grade_points = {
        S: 4,
        A: 3,
        B: 2,
        C: 1,
        D: 0,
        F: 0
    }
end
