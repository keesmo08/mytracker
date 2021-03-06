class CallsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_call, only: [:show, :edit, :update, :destroy]

  # GET /calls
  # GET /calls.json
  def index

    @calls = current_user.calls

    @callCountWeekly = current_user.calls.activeAtDate(5.day.ago).count
    @callCountDaily = @calls.activeAtDate().count
    @callCountWeeklyAverage = ((@calls.activeAtDate(5.day.ago).count) / 5)
    @callCountMonthlyAverage = ((@calls.activeAtDate(1.month.ago).count) / 20)
  end

  # GET /calls/1
  # GET /calls/1.json
  def show
  end

  # GET /calls/new
  def new
    @call = Call.new
  end

  # GET /calls/1/edit
  def edit
  end

  # POST /calls
  # POST /calls.json
  def create
    @call = current_user.calls.new(call_params)
    @call.update_attribute(:date, Date.current)    #Put in the current time
    @call.update_attribute(:time, Time.zone.now)   #Put in the current date

    respond_to do |format|
      if @call.save
        format.html { redirect_to root_path, notice: 'Call was successfully created.' } 
        format.json { render action: 'show', status: :created, location: @call }
      else
        format.html { render action: 'new' }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calls/1
  # PATCH/PUT /calls/1.json
  def update
    respond_to do |format|
      if @call.update(call_params)
        format.html { redirect_to @call, notice: 'Call was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calls/1
  # DELETE /calls/1.json
  def destroy
    @call.destroy
    respond_to do |format|
      format.html { redirect_to calls_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_call
      @call = Call.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def call_params
      params.require(:call).permit(:results, :spoken, :rvm, :lvm, :date, :time)
    end
end
