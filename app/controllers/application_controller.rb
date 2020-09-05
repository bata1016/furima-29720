class ApplicationController < ActionController::Base
  before_action :basic_auth

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, paasword|
      username == ENV["BASIC_AUTH_USER"] && password = ENV["BASIC_USER_PASSWORD"] 
    end
  end
end
