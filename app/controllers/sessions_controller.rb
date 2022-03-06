# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    return redirect_to(root_path) if current_user
  end

  def google_oauth
    result = ::Sessions::UpsertUser.call(auth_data: request.env['omniauth.auth'])

    login(result.user)
    redirect_to root_path
  end

  def destroy
    logout
    redirect_to login_path
  end
end
