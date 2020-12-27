class SessionsController < ApplicationController
  def google_oauth
    auth = request.env['omniauth.auth']
    @user = User.where(email: auth.info.email).first_or_initialize do |user|
      user.name = auth.info.name
      user.email = auth.info.email
    end
    login(@user)
    @user.google_token = auth.credentials.token
    refresh_token = auth.credentials.refresh_token
    @user.google_refresh_token = refresh_token if refresh_token.present?
    @user.save

    redirect_to root_path
  end

  def destroy
    logout
    redirect_to root_path
  end
end
