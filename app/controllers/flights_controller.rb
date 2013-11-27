class FlightsController < ApplicationController
  #before_action :set_flight, only: [:show, :edit, :update, :destroy]
  def search
    @flight = Flight.new
    @title = "Search"
  end
  # GET /flights
  # GET /flights.json
 def index
    @title = "Fights"
    success = true
    error = Hash.new
    unless params[:flight][:leave_time] =~ /\d\d\/\d\d\/\d\d\d\d/ then
      success = false
      error[:leave_time] = "Please input the right leaving time(dd/mm/yyyy)"
    end
    if params[:flight][:leave_city] == "" or params[:flight][:arrive_city] == ""
      error[:city] = "Please input leaving city and arriving city"
    end

    if params[:tripType] == "O" and success then
      leaveTime = Date.strptime(params[:flight][:leave_time], '%m/%d/%Y')
      @flights = Flight.where("leave_city = ? AND arrive_city = ? AND cabin_class = ? 
      AND leave_time >= ? AND leave_time <= ?", params[:flight][:leave_city], 
      params[:flight][:arrive_city], params[:cabin_class], leaveTime -= 3, 
      leaveTime += 3).order(:leave_time).per_page_kaminari params[:page]
      if @flights == []
        error[:city] = "No flights, please input the right city"
     end
    elsif params[:tripType] == "R" and success then
      unless params[:return_time] =~ /\d\d\/\d\d\/\d\d\d\d/ then
        success = false
        #error[:arrive_time] = "Please input the arriving time(dd/mm/yyyy)"
        flash[:error] = "Please input the returning time(dd/mm/yyyy)"
      else
        leaveTime = Date.strptime(params[:flight][:leave_time], '%m/%d/%Y')
        returnTime = Date.strptime(params[:return_time], '%m/%d/%Y')
        @flights = Flight.where("leave_city = ? AND arrive_city = ? AND cabin_class = ? 
        AND leave_time >= ? AND leave_time <= ?", params[:flight][:leave_city], params[:flight][:arrive_city], 
        params[:cabin_class], leaveTime -= 3, leaveTime += 3).order(:leave_time).per_page_kaminari params[:page]
        @flights_return = Flight.where("leave_city = ? AND arrive_city = ? AND cabin_class = ? 
        AND leave_time >= ? AND leave_time <= ?", params[:arrive_city], params[:leave_city], 
        params[:cabin_class], returnTime -= 3, returnTime += 3).order(:leave_time).per_page_kaminari params[:page]
        if @flights_return == []
          error[:city] = "No returning flights, please input the city"
        end
      end
    end

    respond_to do |format|
      if success
        format.html
        format.json { render json: @flight }
      else
        format.html { redirect_to root_path(:error => error).html_safe}
        format.json {  }
      end
    end
  end


  # GET /flights/1
  # GET /flights/1.json
  def show
  end

  # GET /flights/new
  def new
    @flight = Flight.new
  end

  # GET /flights/1/edit
  def edit
  end

  # POST /flights
  # POST /flights.json
  def create
    @flight = Flight.new(flight_params)

    respond_to do |format|
      if @flight.save
        format.html { redirect_to @flight, notice: 'Flight was successfully created.' }
        format.json { render action: 'show', status: :created, location: @flight }
      else
        format.html { render action: 'new' }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flights/1
  # PATCH/PUT /flights/1.json
  def update
    respond_to do |format|
      if @flight.update(flight_params)
        format.html { redirect_to @flight, notice: 'Flight was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flights/1
  # DELETE /flights/1.json
  def destroy
    @flight.destroy
    respond_to do |format|
      format.html { redirect_to flights_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight
      @flight = Flight.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flight_params
      params.require(:flight, :leave_time).permit(:airline, :flight_no, :plane_type, :leave_time, :leave_city, :arrive_time, :arrive_city, :remark, :created_at, :updated_at, :price, :cabin_class)
    end
end
