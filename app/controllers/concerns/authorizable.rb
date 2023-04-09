module Authorizable
  extend ActiveSupport::Concern

  include Authenticable

  included do
    before_action :authorize_user!
  end

  private

  def authorize_user!
    respond_with_not_authorized unless authorized?
  end

  def authorized?
    logged_in?
  end

  def respond_with_not_authorized
    render file: "public/401.html", status: :unauthorized
  end
end
