class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # logged_in? を使うため
  include SessionsHelper
  
  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def require_admin_logged_in
    unless admin_logged_in?
      redirect_to login_url
    end
  end
end