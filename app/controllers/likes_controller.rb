class LikesController < ApplicationController
  def create
	  like = current_user.likes.build(event_id: params[:event_id])
	  like.save

	event_id = params[:event_id]
	redirect_to '/events/' + event_id
  end

  def destroy
	  like = Like.find_by(event_id: params[:event_id], user_id: current_user.id)
	  like.destroy
	event_id = params[:event_id]
	  redirect_to '/events/' + event_id
  end
end
