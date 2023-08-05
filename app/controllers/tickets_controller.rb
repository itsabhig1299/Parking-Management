class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[show edit update destroy]

  def index
    @tickets = Ticket.all
  end

  def new 
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.time_arrival = Time.now
    @ticket.ticket_number = SecureRandom.hex(3)
    @ticket.spot_id = Spot.nearest_unoccupied(params[:ticket][:parking]).order(:nearest_entry).first.id
    if @ticket.save
      @ticket.spot.update(occupied: true)
      redirect_to tickets_path 
    else
      render :new 
    end
  end

  def show 
  end

  def edit 
  end

  def update 
    if @ticket.update(ticket_params)
      redirect_to ticket_path(@ticket)
    else 
      render edit 
    end
  end

  def destroy 
    @ticket.destroy 
    redirect_to tickets_path
  end

  def checkout 
    ticket = Ticket.find_by(id: params[:id])
    ticket.update(time_departure: Time.now) 
    debugger
    ticket.spot.update(occupied: false)
    redirect_to tickets_path
  end


  private
  def ticket_params 
    params.require(:ticket).permit(:time_arrival, :time_departure, :ticket_number, :spot_id, :car_id, :parking)
  end

  def set_ticket 
    @ticket = Ticket.find(params[:id])
  end
end
