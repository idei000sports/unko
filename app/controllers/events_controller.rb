class EventsController < ApplicationController
  #showかeditかupdateかdestroyが呼ばれたときに
  #自動で@eventには指定したイベントが入ってるようになるみたい
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  #編集権限チェック
  before_action :ensure_correct_user, {only:[:edit, :update, :destroy]}


  # GET /events
  # GET /events.json
  def index
	#アクセスした日
	@date = Date.today
	#アクセスした日にあるイベント
	events = Event.where("start_date >= ? AND start_date < ?", @date, @date + 1)
	
	@events = events.page(params[:page]).per(2)

  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:event_title, :event_venue, :event_description, :user_id, :open_date, :start_date, :end_date, :event_adv, :event_door, :prefecture_id, :genre)
    end

	#編集権限チェック
	def ensure_correct_user
	#http://localhost:3000/events/1/edit
		@event = Event.find_by(id: params[:id])
		if user_signed_in?
			if @current_user.id != @event.user_id
				flash[:notice] = "権限がありません"
				redirect_to(root_path)
			end
		else
			flash[:notice] = "権限がありません"
			redirect_to(root_path)
		end
	end


end
