class UsersController < ApplicationController

  def new
    
    @user = User.new(id:1)

  end

  def create
  @users = User.new(title: params[:Create_], content: params[:Create_Content])
    if @gossips.save
      flash[:user_success] = "bon loggin"
    redirect_to '/'
    else
      flash[:alert] = "User non inscris ou loggin"
      redirect_to users_path
    end
  end
end