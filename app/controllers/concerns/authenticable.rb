module Authenticable
  extend ActiveSupport::Concern

  included do
    before_action :set_current_user

    helper_method :logged_in?, :current_user
  end

  private

  def set_current_user
    @set_current_user ||= User.find_by(id: session[:user_id])
  end

  alias current_user set_current_user

  def logged_in?
    !current_user.nil?
  end
end
