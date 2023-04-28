class ClassDay < ApplicationRecord
    has_many :user_subjects, dependent: :destroy

    enum :day, [ :Mon, :Tue, :Wed, :Thu, :Fri, :Sat, :Sun ]

    validates :date, presence: true
end
