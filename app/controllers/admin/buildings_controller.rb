class Admin::BuildingsController < Admin::ApplicationController
  def index
    @buildings = Building.all
  end

  def new
    @building = Building.new
  end

  def create
    @building = Building.new(user_params)
    if @building.save
        redirect_to admin_buildings_path
    else
        render :new
    end
  end

  def destroy
    building = Building.find(params[:id])
    if building.destroy
      redirect_to admin_buildings_path, notice: "Class Schedule was deleted successfully."
    else
      redirect_to admin_buildings_path, alert: "Class Schedule could not be deleted."
    end
  end

  private
  def user_params
    params.require(:building).permit(:id, :place_type)
  end
end
