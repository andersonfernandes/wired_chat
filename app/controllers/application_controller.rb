class ApplicationController < ActionController::Base
  helper_method :current_user

  def login(user)
    session[:current_user_id] = user.id
    @current_user = user
  end

  def logout
    session[:current_user_id] = nil
    @current_user = nil
  end

  def current_user
    return nil unless session[:current_user_id]

    @current_user = User.find(session[:current_user_id])
  end
end
