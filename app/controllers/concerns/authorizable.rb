module Authorizable
  include Authenticable

  extend ActiveSupport::Concern

  included do
    before_action :check_for_authenticated_user
  end

  private

  def check_for_authenticated_user
    respond_with_not_authorized unless authorized?
  end

  def authorized?
    logged_in?
  end

  def respond_with_not_authorized
    render status: :unauthorized
  end
end
