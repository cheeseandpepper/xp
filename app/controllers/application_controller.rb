class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= (session[:user_id] ? User.find(session[:user_id]) : nil)
  end

  helper_method :current_user

  def login_required
    unless logged_in?
      flash[:notice] = "You must be logged in to take this action. Please log In."
      # redirect_to root_path
      redirect_to :back
    end
  end

  def logged_in?
    !!session[:user_id]
  end

  helper_method :logged_in?
end
