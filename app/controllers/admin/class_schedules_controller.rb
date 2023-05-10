class Admin::ClassSchedulesController < Admin::ApplicationController
  def index
    @class_schedules = ClassSchedule.all
  end

  def new
    @class_schedule = ClassSchedule.new
  end

  def create
    @class_schedule = ClassSchedule.new(user_params)
    if @class_schedule.save
        redirect_to admin_class_schedules_path
    else
        render :new
    end
  end

  def destroy
    class_schedule = ClassSchedule.find(params[:id])
    if class_schedule.destroy
      redirect_to admin_class_schedules_path, notice: "Class Schedule was deleted successfully."
    else
      redirect_to admin_class_schedules_path, alert: "Class Schedule could not be deleted."
    end
  end

  private
  def user_params
    params.require(:class_schedule).permit(:name, :start_time, :end_time, :is_class_time)
  end
end
