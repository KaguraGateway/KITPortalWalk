class Event < ApplicationRecord
    validates :title, presence: true
    validates :date, presence: true

    def start_time
        self.date.to_time
    end
end
