class ServiceareasController < ApplicationController
  def index
  end

  def new
    @servicearea = Servicearea.new
    @servicearea.vehicle_id = request.query_parameters[:vehicle_id]
  end

  def create
    vehicleid=params[:servicearea][:vehicle_id]
    @servicearea = Servicearea.new(serviceareas_params)

    if @servicearea.save(serviceareas_params)
      redirect_to vehicle_path(vehicleid), notice: "Servicearea added successfully"
    else
      redirect_to vehicle_path(vehicleid), alert: "Error while inserting Servicearea"
    end
  end

  def edit
    @servicearea = Servicearea.find(params[:id])
  end

  def update
    vehicleid=params[:servicearea][:vehicle_id]
    @servicearea = Servicearea.find(params[:id])

    if @servicearea.update(serviceareas_params)
      redirect_to vehicle_path(vehicleid), notice: "service area updated successfully"
    else
      redirect_to vehicle_path(vehicleid), alert: "Error while updating service area"
    end
  end

  def destroy
    @servicearea = Servicearea.find(params[:id])
    vehicleid = @servicearea.vehicle_id
    if @servicearea.destroy
      redirect_to vehicle_path(vehicleid), notice: "service area deleted successfully"
    else
      redirect_to vehicle_path(vehicleid), alert: "Error while deleted service area"
    end
  end

  private
  def serviceareas_params
    params.require(:servicearea).permit(:name,:pincode,:vehicle_id);
  end
end
