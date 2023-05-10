class Users::SubjectsController < Users::ApplicationController
    before_action :set_buildings, only: %i[new create]
    before_action :set_semesters, only: %i[new create]
    before_action :set_subject_groups, only: %i[new create]
    before_action :set_schedules, only: %i[new create]

  def index
    @subjects = current_user.user_subjects
  end

  def new
    @subject = UserSubject.new
  end

  def create
    @subject = current_user.user_subjects.new(subject_params)
    @subject.classroom = find_or_create_classroom unless params[:classroom][:building_id].blank? || params[:classroom][:room_number].blank?

    error_message = ""
    begin
        @subject.save!
    rescue => e
        error_message += e.message;
    end

    if error_message.present?
        redirect_to new_users_subject_path, alert: error_message
    else
        redirect_to users_subjects_path, notice: "created successfully"
    end
  end

  def destroy
    class_schedule = ClassSchedule.find(params[:id])
    if class_schedule.destroy
      redirect_to users_subjects_path, notice: "Class Schedule was deleted successfully."
    else
      redirect_to users_subjects_path, alert: "Class Schedule could not be deleted."
    end
  end

  private
  def subject_params
    params.require(:user_subject).permit(:subject_name, :credits, :day, :class_schedule_id, :subject_group_id, :semester_id, :half_semester_id)
  end

  def set_buildings
    @buildings = Building.all
  end

  def set_semesters
    @semesters = Semester.all
    @half_semesters = HalfSemester.all
  end

  def set_subject_groups
    @subject_groups = SubjectGroup.all
  end

  def set_schedules
    @schedules = ClassSchedule.all
  end

  def find_or_create_classroom
    Classroom.where(building_id: params[:classroom][:building_id]).where(room_number: params[:classroom][:room_number].to_i).first_or_create
  end
end
