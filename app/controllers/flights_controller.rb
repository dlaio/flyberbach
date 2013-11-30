class FlightsController < ApplicationController
  #before_action :set_flight, only: [:show, :edit, :update, :destroy]

  def index
    @flights = Flight.paginate(page: params[:page])
  end

  def search
    @flight = Flight.new
    @title = "Search"
  end
  

#  def index
#    puts "Here!"
#    @title = "Fights"
#    success = true
#    error = Hash.new
#    unless params[:flight][:leave_time] =~ /\d\d\/\d\d\/\d\d\d\d/ then
#      success = false
#      error[:leave_time] = "Please input the right leaving time(dd/mm/yyyy)"
#    end
#    if params[:flight][:leave_city] == "" or params[:flight][:arrive_city] == ""
#      error[:city] = "Please input leaving city and arriving city"
#    end

#    if success and params[:tripType] != "R" then
#      puts "one way trip selected"
#      leaveTime = Date.strptime(params[:flight][:leave_time], '%m/%d/%Y')
#      @flights = Flight.where("leave_city = ? AND arrive_city = ? AND leave_time >= ?", params[:flight][:leave_city], params[:flight][:arrive_city], leaveTime).order(:leave_time)
#      if @flights == []
#        error[:city] = "No flights, please input the right city"
#     end
#    elsif params[:tripType] == "R" and success 
#      puts "round trip selected"
#      unless params[:return_time] =~ /\d\d\/\d\d\/\d\d\d\d/ then
#        success = false
        #error[:arrive_time] = "Please input the arriving time(dd/mm/yyyy)"
 #       flash[:error] = "Please input the returning time(dd/mm/yyyy)"
 #     else
 #       leaveTime = Date.strptime(params[:flight][:leave_time], '%m/%d/%Y')
 #       returnTime = Date.strptime(params[:return_time], '%m/%d/%Y')
 #       @flights = Flight.where("leave_city = ? AND arrive_city = ? AND leave_time >= ? AND leave_time <= ?", params[:flight][:leave_city], params[:flight][:arrive_city], leaveTime -= 3, leaveTime += 3).order(:leave_time).per_page_kaminari params[:page]
 #       @flights_return = Flight.where("leave_city = ? AND arrive_city = ? AND leave_time >= ? AND leave_time <= ?", params[:arrive_city], params[:leave_city], 
 #       params[:cabin_class], returnTime -= 3, returnTime += 3).order(:leave_time).per_page_kaminari params[:page]
 #       if @flights_return == []
 #         error[:city] = "No returning flights, please input the city"
 #       end
 #     end
 #   end

 #   @flights = Flight.paginate(page: params[:page])
    #respond_to do |format|
    #  if success
    #    format.html
    #    format.json { render json: @flight }
    #  else
    #    format.html { redirect_to root_path(:error => error).html_safe}
    #    format.json {  }
    #  end
    #end
 # end


  # GET /flights/1
  # GET /flights/1.json
  def show
    @flight = Flight.find(params[:id])
  end

  # GET /flights/new
  def new
    @flight = Flight.new
  end

  # GET /flights/1/edit
  def edit
    @flight = Flight.find(params[:id])
  end

  # POST /flights
  # POST /flights.json
  def create
    puts "Create"
    @flight = Flight.new(flight_params)

    if @flight.save
      flash[:success] = "Flight created"
      redirect_to @flight
    else
      #render 'new'
    end
  end

  # PATCH/PUT /flights/1
  # PATCH/PUT /flights/1.json
  def update
    puts "Update"
    if @flight.update_attributes(flight_params)
      flash[:success] = "Flight information updated"
      redirect_to @flight
    else
      render 'edit'
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
      params.require(:flight).permit(:airline, :flight_no, :plane_type, :leave_time, :leave_city, :arrive_time, :arrive_city, :remark, :created_at, :updated_at, :price)
    end
end
