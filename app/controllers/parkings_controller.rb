class ParkingsController < ApplicationController
  before_action :set_parking, only: %i[show edit update destroy]

  def index
    @parkings = Parking.all
    render json: @parkings, status: 200
  end

  def new
    @parking = Parking.new
  end

  def create 
    @parking = Parking.new(parking_params)
    if @parking.save 
      redirect_to parkings_path, notice: 'Parking has been created successfully', status: :created
    else
      render :new 
    end
  end

  def show 
  end

  def edit 
  end

  def update 
    if @parking.update(parking_params)
      redirect_to parking_path(@parking), notice: 'Parking has been updated successfully', status: :ok
    else 
      render edit 
    end
  end

  def destroy 
    @parking.destroy 
    redirect_to parkings_path, notice: 'Parking has been deleted successfully', status: :ok
  end

  private
  def parking_params
    params.require(:parking).permit(:name)
  end

  def set_parking 
    @parking = Parking.find(params[:id])
  end
end
