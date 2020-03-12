class ApplicationController < ActionController::Base


	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :set_current_user

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
	end

	def set_current_user
		@current_user = User.find_by(id: session[:user_id])
	end

	#権限チェック。出演者の編集ページにアクセスしたときに、作成したIDと違ったらトップページへ戻る
	#http://localhost:3000/events/1/editにアクセスしたときとか
	def ensure_correct_user
		@event = Event.find_by(id: params[:id])
		if user_signed_in?
			#ログインしててユーザー名違う場合
			if @current_user.id != @event.user_id
				flash[:notice] = "権限がありません"
				redirect_to(root_path)
			end
		else
			#ログインすらしてない場合
			flash[:notice] = "権限がありません"
			redirect_to(root_path)
		end
	end

end
