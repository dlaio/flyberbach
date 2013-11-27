class FlightLegsController < ApplicationController
  before_action :set_flight_leg, only: [:show, :edit, :update, :destroy]

  # GET /flight_legs
  # GET /flight_legs.json
  def index
    @flight_legs = FlightLeg.all
  end

  # GET /flight_legs/1
  # GET /flight_legs/1.json
  def show
  end

  # GET /flight_legs/new
  def new
    @flight_leg = FlightLeg.new
  end

  # GET /flight_legs/1/edit
  def edit
  end

  # POST /flight_legs
  # POST /flight_legs.json
  def create
    @flight_leg = FlightLeg.new(flight_leg_params)

    respond_to do |format|
      if @flight_leg.save
        format.html { redirect_to @flight_leg, notice: 'Flight leg was successfully created.' }
        format.json { render action: 'show', status: :created, location: @flight_leg }
      else
        format.html { render action: 'new' }
        format.json { render json: @flight_leg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flight_legs/1
  # PATCH/PUT /flight_legs/1.json
  def update
    respond_to do |format|
      if @flight_leg.update(flight_leg_params)
        format.html { redirect_to @flight_leg, notice: 'Flight leg was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @flight_leg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flight_legs/1
  # DELETE /flight_legs/1.json
  def destroy
    @flight_leg.destroy
    respond_to do |format|
      format.html { redirect_to flight_legs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight_leg
      @flight_leg = FlightLeg.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flight_leg_params
      params.require(:flight_leg).permit(:leg_no, :flight_no, :route_id, :price)
    end
end
