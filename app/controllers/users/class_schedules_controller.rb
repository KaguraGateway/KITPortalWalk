class Users::ClassSchedulesController < Users::ApplicationController
  def index
    # これもAdminとUserで同じコントローラーが存在するのはよくない気がするかも
    @class_schedules = ClassSchedule.all
  end
end
