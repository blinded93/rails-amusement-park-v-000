class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Welcome back, #{@user.name}!"
    else
      render :new
    end
  end

  def destroy
    if !session[:user_id].nil?
      reset_session
    end
    redirect_to root_path, notice: "Come back soon!"
  end
end
