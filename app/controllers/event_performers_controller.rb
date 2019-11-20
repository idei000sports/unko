class EventPerformersController < ApplicationController
  before_action :set_event_performer, only: [:show, :edit, :update, :destroy]

  def input
	@id = params[:id]
	@old_event_performers = EventPerformer.where("event_id = " + params[:id])
	@event_performer = EventPerformer.new
  end

  # POST /event_performers
  # POST /event_performers.json
  def create
    @event_performer = EventPerformer.new(event_performer_params)

    respond_to do |format|
      if @event_performer.save
        format.html { redirect_to action: 'input', id:@event_performer.event_id }
        format.json { render :show, status: :created, location: @event_performer }
      else
        format.html { render :new }
        format.json { render json: @event_performer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_performers/1
  # PATCH/PUT /event_performers/1.json
  def update
    respond_to do |format|
      if @event_performer.update(event_performer_params)
        format.html { redirect_to action: 'input', notice: 'Event performer was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_performer }
      else
        format.html { render :edit }
        format.json { render json: @event_performer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_performers/1
  # DELETE /event_performers/1.json
  def destroy
    @event_performer.destroy
    respond_to do |format|
      format.html { redirect_to action: 'input', id:@event_performer.event_id, notice: 'Event performer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_performer
      @event_performer = EventPerformer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_performer_params
      params.require(:event_performer).permit(:event_id, :performer_name)
    end
end
