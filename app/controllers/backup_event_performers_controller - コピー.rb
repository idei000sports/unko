class EventPerformersController < ApplicationController
  before_action :set_event_performer, only: [:destroy]

	#出演者からイベントを絞り込むときのメソッド
	def select
		@performer_name = params[:performer_name]
		events = Event.all
		@events = events.joins(:event_performers).where(event_performers: { performer_name: params[:performer_name] }) if params[:performer_name].present?
	end



  def input
	@event = Event.find(params[:id])
	@event_performers = EventPerformer.where("event_id = ?" , @event.id)
	@event_performer = EventPerformer.new
  end

  def create
	@event_performer = EventPerformer.new(event_performer_params)
	@event_id = @event_performer.event_id
	@event_performer.save

	redirect_to controller:'event_performers', action: 'input', id: @event_id
  end


  def destroy
	@event_id = @event_performer.event_id
	@event_performer.destroy

	redirect_to controller:'event_performers', action: 'input', id: @event_id
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    #コールバックを使用して、アクション間で共通のセットアップまたは制約を共有します。
    def set_event_performer
      @event_performer = EventPerformer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    #恐ろしいインターネットからのパラメーターを決して信用せず、ホワイトリストのみを許可します。
    def event_performer_params
      params.require(:event_performer).permit(:event_id, :performer_name)
    end

end
