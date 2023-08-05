class CarsController < ApplicationController
  before_action :set_car, only: %i[show edit update destroy]

  def index
    respond_to do |car|
      car.html{
        @cars = Car.all.order("created_at DESC")
      }

      car.json{
        #render json: Car.all.order("created_at DESC")
        render json: Car.all, status: 200
      }
    end
    #@cars = Car.all
    #render json: @cars, status: 200
  end

  def new
    @car = Car.new
  end

  def create 
    @car = Car.new(car_params)
    if @car.save
      redirect_to cars_path, notice: 'Car has been created successfully', status: :created
    else
      render :new 
    end
  end

  def show 
  end

  def edit 
  end

  def update 
    if @car.update(car_params)
      redirect_to car_path(@car), notice: 'Cast has been updated successfully', status: :ok
    else 
      render edit 
    end
  end

  def destroy
    @car.destroy 
    redirect_to cars_path, notice: 'Car has been deleted successfully', status: :ok
  end

  private 
  def car_params 
    params.require(:car).permit(:color, :registration_number)
  end

  def set_car
    @car = Car.find(params[:id])
  end
end
