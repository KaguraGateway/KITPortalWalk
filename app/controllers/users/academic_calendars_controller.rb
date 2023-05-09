class Users::AcademicCalendarsController < Users::ApplicationController
    def index
        # TODO: パフォーマンス考える
        # AdminとUserで同じコントローラーが存在するのはよくない気がするかも
        events = Event.all
        class_days = ClassDay.all
        @schedules = [].concat(events, class_days)
    end
end
