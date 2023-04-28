class ClassSchedule < ApplicationRecord
    has_many :user_subjects, dependent: :destroy

    validates :name, presence: true
    validates :start_time, presence: true
    validates :end_time, presence: true
end
