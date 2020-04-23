class VehiclesController < ApplicationController
  def index
    if current_lcvowner
      @vehicles = current_lcvowner.vehicles
    end
  end

  def new
    @vehicle = current_lcvowner.vehicles.new
  end

  def create
    # @vehicle = current_lcvowner.vehicles.new(params[:vehicle])
    if current_lcvowner.vehicles.create(vehicle_params)
      redirect_to vehicles_path, notice: "Vehicle added successfully"
    else
      redirect_to vehicles_path, alert: "Error while inserting vehicle"
    end
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  def update
    @vehicle = Vehicle.find(params[:id])
    if @vehicle.update(vehicle_params)
      redirect_to vehicles_path, notice: "Vehicle added successfully"
    else
      redirect_to vehicles_path, alert: "Error while inserting vehicle"
    end
  end

  def show
    @vehicle = Vehicle.find(params[:id])
    @lcvowner = @vehicle.lcvowner
    @serviceareas = @vehicle.serviceareas
    @isOwner = false
  
    if current_user
      @isOwner = false;
    elsif current_lcvowner
      @isOwner = true;
    end

  end

  def destroy
    @vehicle = Vehicle.find(params[:id])
    if @vehicle.destroy
      redirect_to vehicles_path, notice: "Vehicle deleted successfully"
    else
      redirect_to vehicles_path, alert: "Error while deleting vehicle"
    end
  end

  private
  def vehicle_params
    params.require(:vehicle).permit(:name,:brand,:model,:capacity,:permit_type,:body_type);
  end
end
