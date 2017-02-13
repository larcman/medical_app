class UsersController < ApplicationController
  before_action :require_user
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params(true))
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
    @user = User.find(params[:id])
    redirect_to action: 'edit'
  end
  
  def edit
    @user = User.find(params[:id])
    password = BCrypt::Password.new(@user.password_digest)
    puts password 
  end

  def update
    @user = User.find(params[:id])
    curr_user = User.find(session[:user_id])
    if @user.update(user_params(false))
      if curr_user.isadmin
        redirect_to action: 'index'
      else
        redirect_to action: 'edit'
      end
    else
      redirect_to action: 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to action: 'index'
  end

  private
  def user_params (create)
    if (create)
      params.require(:user).permit(:firstname, :lastname, :email, :username, :password)
    else
      params.require(:user).permit(:firstname, :lastname, :email, :username, :password, :isadmin)
    end  
   end
end
