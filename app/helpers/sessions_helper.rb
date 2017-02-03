module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  # returns the current logged-in user
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # check if the given user is the current user.
  def current_user?(user)
    user == current_user
  end

  # check for logged in
  def logged_in?
    !current_user.nil?
  end

  # log out the current user
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
