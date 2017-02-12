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
      redirect_to action: 'index'
    else
      redirect_to '/signup'
    end
  end
  
  def index
    # returns all users except Admin
    @users = User.where.not(id: '0').order(username: :asc)
  end
  
  def show
    
  end
  
  def destroy
    puts params
    @user = User.find(params[:id])
    @user.destroy
    redirect_to action: 'index'
  end

  private
  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :username, :password)
   end
end
