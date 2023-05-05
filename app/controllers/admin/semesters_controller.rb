class Admin::SemestersController < Admin::ApplicationController
    before_action :check_params, only: %i[create]

  def index
    @semesters = Semester.all
  end

  def new
  end

  def create
    p params

    begin
        ActiveRecord::Base.transaction do
            semester = Semester.create!(year: params[:year], gakki: params[:gakki], start_date: params[:start_date], end_date: params[:end_date])
            half_semester_start_date = params[:start_date]
            half_semester_end_date = nil

            params[:half_semester].each do |half_semester|
                HalfSemester.create!(
                    semester: semester,
                    season_type: half_semester[:season_type],
                    start_date: half_semester_start_date,
                    end_date: half_semester_end_date || half_semester[:end_date]
                )
                half_semester_start_date = (half_semester_end_date || half_semester[:end_date]).to_date.next_day
                half_semester_end_date = params[:end_date]
            end
        end
    rescue => e
        p e
        redirect_to admin_semesters_path, alert: "Semester created failed"
    else
        redirect_to admin_semesters_path, notice: "Semester created successfully"
    end
  end

  def check_params
    # TODO: 他のparamsもチェックする
    if params[:half_semester].blank? || params[:half_semester].size != 2
        redirect_to admin_semesters_path, alert: "半学期の要素数が２でない"
    end
  end
end
