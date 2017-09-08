class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def require_login
    if !session[:user_id]
      redirect_to root_path
    end
  end

  helper_method :current_user, :logged_in?
end
