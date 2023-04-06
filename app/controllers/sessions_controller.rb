class SessionsController < ApplicationController
  before_action :set_user, only: :create

  def create
    if @user.authenticate session_params[:password]
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Logged in!'
    else
      redirect_to login_path, alert: 'Invalid email or password'
    end
  end

  def new; end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: 'Logged out!'
  end

  private

  def set_user
    @user = User.find_by(email: session_params[:email])
    respond_with_not_found unless @user
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
