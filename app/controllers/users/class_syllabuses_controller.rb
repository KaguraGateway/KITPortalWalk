class Users::ClassSyllabusesController < Users::ApplicationController
    require "csv"
    before_action :set_date, only: %i[index]

    def index
        # 今学期を取得する
        current_semester = Semester.current

        class_days = ClassDay.where("date >= ? AND date <= ?", current_semester.start_date, current_semester.end_date)
        @subjects = current_user.user_subjects
            .where(semester_id: current_semester.id)
            .eager_load(:half_semester, :class_schedule, :classroom)
            .each_with_object(Hash.new { |v, k| v[k] = [] }) do |subject, hash|
                hash[subject.day] << subject
            end

        respond_to do |format|
            format.html
            format.csv do |csv|
                send_data render_csv(class_days, @subjects), filename: "class_syllabuses.csv", type: :csv
            end
        end
    end

    private
    def set_date
        @date = params[:date].nil? ? Date.today : params[:date].to_date
    end

    def render_csv(class_days, subjects)
        CSV.generate do |csv|
            csv << ["Subject", "Start Date", "Start Time", "End Date", "End Time", "Location"]
            class_days.each do |class_day|
                subjects[class_day.day].each do |subject|
                    if subject.half_semester_id.nil? || class_day.date.between?(subject.half_semester.start_date, subject.half_semester.end_date)
                        subject_column = [
                            "#{subject.subject_name} (#{subject.classroom.building_id}・#{subject.classroom.room_number})",
                            class_day.date,
                            subject.class_schedule.start_time.strftime("%H:%M"),
                            class_day.date,
                            subject.class_schedule.end_time.strftime("%H:%M"),
                            "#{subject.classroom.building_id}号館#{subject.classroom.room_number}"
                        ]
                        csv << subject_column
                    end
                end
            end
        end
    end
end
