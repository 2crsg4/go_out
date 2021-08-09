class SessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  #before_action -> { redirect_back(fallback_location: root_url) if logged_in? }

  def new
  end

  def create
    #user_name, password = params[:session].values_at(:user_name, :password)
    #@user = login(user_name, password)
    @user = login(params[:user_name], params[:password])
    binding.irb
    if @user
      redirect_to(root_path, notice: 'ログインしました')
    else
      flash.now[:alert] = 'メールアドレスかパスワードが正しくありません'
      render :new
    end
  end

  def destroy
    binding.irb
    logout
    redirect_to(login_path, notice: 'ログアウトしました')
  end
end
