class GenresController < ApplicationController
before_action :set_genre, only: [:destroy]
	
	def select
		@genre_name = params[:name]
		events = Event.all
		@events = events.joins(:genres).where(genres: { name: params[:name] }) if params[:name].present?
		
	end


	def create
		@genre = Genre.new(genre_params)
		@genre.save
		event_id = @genre.event_id
		redirect_to action: :input, event_id:event_id
	end

	def destroy
		event_id = @genre.event_id
		@genre.destroy
		redirect_to action: :input, event_id:event_id
	end

	def input
		@event_id = params[:event_id]
		@genres = Genre.where("event_id = " + params[:event_id])
		@genre = Genre.new
	end


private 

	def set_genre
		@genre = Genre.find(params[:id])
	end

	def genre_params
		params.require(:genre).permit(:event_id, :name)
	end
end
