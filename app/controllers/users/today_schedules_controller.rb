class Users::TodaySchedulesController < Users::ApplicationController
    before_action :set_date, only: %i[index]

    def index
        # 今学期を取得する
        current_semester = Semester.current
        current_half_semester = HalfSemester.current
        # 今日の授業曜日を取得
        @class_day = ClassDay.find_by(date: @date)
        # 時間割を取得
        @schedules = ClassSchedule.where(is_class_time: true)

        # 授業曜日でなければ、授業はないので、空の配列を返す
        (@subjects = {}) && return if @class_day.nil?

        @subjects = current_user.user_subjects
            .where(semester_id: current_semester.id, day: @class_day.day, half_semester_id: [nil, current_half_semester.id])
            .each_with_object(Hash.new { |v, k| v[k] = [] }) do |subject, hash|
                hash[subject.class_schedule_id] << subject
            end
    end

    private
    def set_date
        @date = params[:date].nil? ? Date.today : params[:date].to_date
    end
end
