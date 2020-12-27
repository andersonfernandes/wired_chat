class ApplicationController < ActionController::Base
  def log_in(user)
    session[:current_user_id] = user.id
    self.current_user = user
  end

  def log_out
    session[:current_user_id] = nil
    self.current_user = nil
  end

  def current_user
    @current_user = User.find(session[:current_user_id])
  end

  private

  attr_writer :current_user
end
