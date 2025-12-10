# app/controllers/users/sessions_controller.rb
class Users::SessionsController < Devise::SessionsController
  # newアクション（ログイン画面）だけ Basic 認証
  before_action :basic_auth, only: [:new]

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] &&
      password == ENV['BASIC_AUTH_PASSWORD']
    end
  end
end
