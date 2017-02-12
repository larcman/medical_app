class UsersController < ApplicationController
  before_action :require_user
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    center = Center.where(id: '0').first;
    @user.center_id = center.id

    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end
  
  def index
    # returns all users except Admin
    # @users = User.where.not(id: '0').order(username: :desc)
    @users = User.all.order(username: :desc)
  end

  private
  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :username, :password)
   end
end
