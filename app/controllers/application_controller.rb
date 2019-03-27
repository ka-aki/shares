class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  # before_action :set_current_user

  #   def set_current_user
  #     @current_user = User.find_by(id: session[:user_id])
  #     if @current_user
  #       @group_user = GroupUser.find_by(user_id: @current_user.id)
  #     end
  #   end

  #   def authenticate_user
  #    if @current_user == nil
  #     redirect_to("/login")
  #    end
  #   end

  #   def forbid_login_user
  #     if
  #       @current_user
  #       redirect_to("/posts")
  #     end
  #   end
end