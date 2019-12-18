class AccountsController < ApplicationController
	def index
		@user = User.find_by(id: current_user.id)
		
		#@createds =Event.where(user_id: current_user.id)
		@createds =Event.includes(:prefecture).where(user_id: current_user.id)
	end

	def mylist
		@user = User.find_by(id: current_user.id)
		@likes = Like.where(user_id: current_user.id).all	
	end

end
