class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to(admin_path, notice: 'Login successful')
    else
      redirect_to :login, alert:'Login failed'
    end
  end

  def destroy
    logout
    redirect_to([:login], notice: 'Logged out!')
  end
end
