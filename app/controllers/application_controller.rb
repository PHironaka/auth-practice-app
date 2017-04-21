class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authorize

# by running the current user method, it will run current user. Or set the current user by goin into the current session and pull the user id from it. But only return it if a sesion has a user id in it, otherwise return nil.
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def authorize
    redirect_to root_path unless logged_in?
  end
end
