class Building < ApplicationRecord
    has_many :classrooms, dependent: :destroy

    enum :place_type, [ :oogigaoka, :yatsukaho ]
end
