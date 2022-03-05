# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    return redirect_to(root_path) if current_user
  end

  def google_oauth
    auth = request.env['omniauth.auth']
    user = User.where(email: auth.info.email).first_or_initialize do |u|
      u.name = auth.info.name
      u.email = auth.info.email
      u.image_url = auth.info.image
    end
    user.google_token = auth.credentials.token
    refresh_token = auth.credentials.refresh_token
    user.google_refresh_token = refresh_token if refresh_token.present?
    user.save

    login(user)
    redirect_to root_path
  end

  def destroy
    logout
    redirect_to login_path
  end
end
