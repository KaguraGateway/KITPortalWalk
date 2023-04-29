class Admin::AcademicCalendarsController < Admin::ApplicationController
  def index
    # TODO: パフォーマンス考える
    events = Event.all
    class_days = ClassDay.all
    @schedules = [].concat(events, class_days)
  end

  def new
    p params
  end

  def create
    # TODO: バリデーションとかファイルの形式とかチェックする
    json_str = params[:upload_file].read
    json = JSON.parse(json_str)
    p json[:events]

    events = []
    json["events"].each do |event|
        events.push({
            title: event["title"],
            date: event["date"].to_date,
        })
    end

    class_days = []
    json["classes"].each do |class_day|
        class_days.push({
            date: class_day["date"].to_date,
            day: ClassDay.days[class_day["class_day"]]
        })
    end

    begin
        ActiveRecord::Base.transaction do
            Event.create!(events)
            ClassDay.create!(class_days)
        end
    rescue
        redirect_to admin_academic_calendars_path, alert: "Academic Calendar created failed"
    else
        redirect_to admin_academic_calendars_path, notice: "Academic Calendar created successfully"
    end
  end
end
