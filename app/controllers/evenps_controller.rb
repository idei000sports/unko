class EvenpsController < ApplicationController
  before_action :set_evenp, only: [:show, :edit, :update, :destroy]

  # GET /evenps
  # GET /evenps.json
  def index
    @evenps = Evenp.all
  end

  # GET /evenps/1
  # GET /evenps/1.json
  def show
  end

  # GET /evenps/new
  def new
    @evenp = Evenp.new
  end

  # GET /evenps/1/edit
  def edit
  end

  # POST /evenps
  # POST /evenps.json
  def create
    @evenp = Evenp.new(evenp_params)

    respond_to do |format|
      if @evenp.save
        format.html { redirect_to @evenp, notice: 'Evenp was successfully created.' }
        format.json { render :show, status: :created, location: @evenp }
      else
        format.html { render :new }
        format.json { render json: @evenp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evenps/1
  # PATCH/PUT /evenps/1.json
  def update
    respond_to do |format|
      if @evenp.update(evenp_params)
        format.html { redirect_to @evenp, notice: 'Evenp was successfully updated.' }
        format.json { render :show, status: :ok, location: @evenp }
      else
        format.html { render :edit }
        format.json { render json: @evenp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evenps/1
  # DELETE /evenps/1.json
  def destroy
    @evenp.destroy
    respond_to do |format|
      format.html { redirect_to evenps_url, notice: 'Evenp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evenp
      @evenp = Evenp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evenp_params
      params.require(:evenp).permit(:title, :description, :start_date, :end_date)
    end
end