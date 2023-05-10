class ClassDay < ApplicationRecord
    has_many :user_subjects, dependent: :destroy

    enum :day, [ :Mon, :Tue, :Wed, :Thu, :Fri, :Sat, :Sun ]

    validates :date, presence: true

    def start_time
        self.date.to_time
    end

    def self.today
        self.find_by(date: Date.today)
    end
end
