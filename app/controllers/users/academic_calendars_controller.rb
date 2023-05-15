class Users::AcademicCalendarsController < Users::ApplicationController
    require "csv"

    def index
        # TODO: パフォーマンス考える
        # AdminとUserで同じコントローラーが存在するのはよくない気がするかも
        events = Event.all
        class_days = ClassDay.all
        @schedules = [].concat(events, class_days)

        respond_to do |format|
            format.html
            format.csv do |csv|
                send_data render_csv(events), filename: "academic_calendars.csv", type: :csv
            end
        end
    end

    private
    def render_csv(events)
        CSV.generate do |csv|
            csv << ["Subject", "Start Date", "End Date"]
            events.each do |event|
                event_column = [
                    event.title,
                    event.date,
                    event.date
                ]
                csv << event_column
            end
        end
    end
end
