module SessionsHelper

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:session_id]
  end

  def logged_in?
    !!@current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end

end
