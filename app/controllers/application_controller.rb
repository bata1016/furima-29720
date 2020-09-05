class ApplicationController < ActionController::Base
  before_action :basic_auth

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, paasword|
      username = 'kwbt' && password = 'a4crCy56' 
    end
  end
end
