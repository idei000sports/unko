class GenresController < ApplicationController
	before_action :set_genre, only: [:destroy]
	before_action :ensure_correct_user, {only:[:input, :edit]}

	#ƒWƒƒƒ“ƒ‹‚Å’T‚·—p
	def select
		@genre_name = params[:name]
		events = Event.all
		@events = events.joins(:genres).where(genres: { name: params[:name] }) if params[:name].present?
		
	end

	def input
		@event = Event.find(params[:id])
		@genres = Genre.where("event_id = ?", @event.id)
		@genre = Genre.new
	end

	def create
		@genre = Genre.new(genre_params)
		@event_id = @genre.event_id
		@genre.save

		redirect_to controller:'genres', action: :'input', id: @event_id
	end

	def destroy
		@event_id = @genre.event_id
		@genre.destroy
		redirect_to controller: 'genres', action: :'input', id: @event_id
	end



private 

	def set_genre
		@genre = Genre.find(params[:id])
	end

	def genre_params
		params.require(:genre).permit(:event_id, :name)
	end
end
