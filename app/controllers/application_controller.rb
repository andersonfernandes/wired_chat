# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery

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

    @current_user ||= User.find(session[:current_user_id])
  end

  def authenticate!
    return redirect_to(login_path) if session[:current_user_id].blank?
  end
end
