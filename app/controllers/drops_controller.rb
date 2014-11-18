class DropsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_drop, only: [:show, :edit, :update, :destroy]

  # GET /drops
  # GET /drops.json
  def index
    @drops = current_user.drops
  end

  # GET /drops/1
  # GET /drops/1.json
  def show
  end

  # GET /drops/new
  def new
    @drop = Drop.new
  end

  # GET /drops/1/edit
  def edit
  end

  # POST /drops
  # POST /drops.json
  def create
    @drop = current_user.drops.new(drop_params)

    respond_to do |format|
      if @drop.save
        format.html { redirect_to drops_path, notice: 'Drop was successfully created.' }
        format.json { render action: 'show', status: :created, location: @drop }
      else
        format.html { render action: 'new' }
        format.json { render json: @drop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drops/1
  # PATCH/PUT /drops/1.json
  def update
    respond_to do |format|
      if @drop.update(drop_params)
        format.html { redirect_to @drop, notice: 'Drop was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @drop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drops/1
  # DELETE /drops/1.json
  def destroy
    @drop.destroy
    respond_to do |format|
      format.html { redirect_to drops_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drop
      @drop = Drop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drop_params
      params.require(:drop).permit(:account, :scheduledrop, :actualdrop, :contactname, :contactaddress, :contactphone, :contactemail, :notes)
    end
end
