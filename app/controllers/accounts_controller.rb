class AccountsController < ApplicationController
  def index
	@user = User.find_by(id: current_user.id)
	
	@likes = Like.where(user_id: @user.id).all
  end
end
