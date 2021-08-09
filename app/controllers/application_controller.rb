class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  before_action :require_login

  protected

  def not_authenticated
    redirect_to login_url
  end
end
