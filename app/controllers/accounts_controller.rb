class AccountsController < ApplicationController
	def index
		@createds =Event.includes(:prefecture).where(user_id: current_user.id)
	end

	def mylist
		@likes = Like.where(user_id: current_user.id).all	
	end

end
