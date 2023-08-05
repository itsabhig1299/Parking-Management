class SpotsController < ApplicationController
	before_action :set_spot, only: %i[show edit update destroy]
	def index 
		@spots = Spot.all
    render json: @cars, status: 200
	end

	def new 
		@spot = Spot.new
	end

	def create 
    @spot = Spot.new(spot_params)
    if @spot.save 
      redirect_to spots_path, notice: 'Spot has been created successfully', status: :created
    else
      render :new 
    end
  end

  def show
  end

  def edit
  end

  def update 
    if @spot.update(spot_params)
      redirect_to spot_path(@spot)
    else 
      render edit 
    end
  end

  def destroy 
    @spot.destroy 
    redirect_to spots_path
  end


  private
  def spot_params 
  	params.require(:spot).permit(:name, :nearest_entry, :occupied, :parking_id)
  end

  def set_spot 
    @spot = Spot.find(params[:id])
  end
end
