class FindersController < ApplicationController
  
  def index
    
    unless (request.query_parameters[:pincode] == "")
      @targetlist = filter_by_pincode(request.query_parameters[:pincode])
      @targetlist = get_vehicles_list(@targetlist)
    end

    unless (request.query_parameters[:model] == "")
      @targetlist = filter_by_model(@targetlist,request.query_parameters[:model])
    end

    unless (request.query_parameters[:brand] == "")
      @targetlist = filter_by_brand(@targetlist,request.query_parameters[:brand])
    end

    unless (request.query_parameters[:capacity] == "")
      @targetlist = filter_by_capacity(@targetlist,request.query_parameters[:capacity])
    end

    unless (request.query_parameters[:capacity] == "")
      @targetlist = filter_by_permit_type(@targetlist,request.query_parameters[:permit_type])
    end

    unless (request.query_parameters[:body_type] == "")
      @targetlist = filter_by_body_type(@targetlist,request.query_parameters[:body_type])
    end
    
  end

  private
  def filter_by_pincode(pincode)
    list = Servicearea.where(pincode: pincode)
  end

  def get_vehicles_list(filtered_pincode_list)
    vehicle_list = filtered_pincode_list.map{|servicearea| servicearea.vehicle}
  end

  def filter_by_brand(vehicle_list, brand_name)
    filtered_list = vehicle_list.select{|vehicle| vehicle.brand == brand_name}
  end

  def filter_by_model(vehicle_list, model_name)
    filtered_list = vehicle_list.select{|vehicle| vehicle.model == model_name}
  end

  def filter_by_capacity(vehicle_list, capacity)
    filtered_list = vehicle_list.select{|vehicle| vehicle.capacity == capacity}
  end

  def filter_by_permit_type(vehicle_list, permit_type)
    filtered_list = vehicle_list.select{|vehicle| vehicle.permit_type == permit_type}
  end

  def filter_by_body_type(vehicle_list, body_type)
    filtered_list = vehicle_list.select{|vehicle| vehicle.body_type == body_type}
  end
end
