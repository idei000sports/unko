class ImagesController < ApplicationController
  before_action :set_image, only: [:destroy]

  def input
	@event_id = params[:event_id]
	@old_image = Image.where("event_id = " + params[:event_id])
	@image = Image.new
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(image_params)
    @event_id = @image.event_id

    @image.save
    redirect_to controller:'images', action: 'input', event_id: @event_id

  end


  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
	@event_id = @image.event_id
	@image.destroy
	redirect_to controller:'images', action: 'input', event_id: @event_id
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:event_id, :image_id, :image)
    end
end