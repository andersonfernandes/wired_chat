# frozen_string_literal: true

module Sessions
  class UpsertUser
    include Interactor

    def call
      user = User.find_or_initialize_by(email: user_info.email)
      user.assign_attributes(user_params)

      user.save
      context.user = user
    end

    private

    def user_params
      params = {
        name: user_info.name,
        image_url: user_info.image,
        google_token: auth_credentials.token
      }

      refresh_token ? params.merge(google_refresh_token: refresh_token) : params
    end

    def user_info
      @user_info ||= context.auth_data.info
    end

    def auth_credentials
      @auth_credentials ||= context.auth_data.credentials
    end

    def refresh_token
      @refresh_token ||= auth_credentials.refresh_token
    end
  end
end
