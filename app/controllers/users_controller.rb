class UsersController < ApplicationController
  before_action :require_user
  before_action :is_admin, only: [:index, :new, :create]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params(true))
    center = Center.where(id: '0').first;
    @user.center_id = center.id
    begin
      @user.save!
      redirect_to action: 'index'
    rescue ActiveRecord::RecordNotUnique
      flash[:error] = "Error! El nombre de usuario elegido, ya esta en uso."
      redirect_to action: 'new'
    rescue ActiveRecord::RecordInvalid
      flash[:error] = "Error! Asegurese de llenar todos los campos."
      redirect_to action: 'new'
    rescue
      flash[:error] = "Error! Asegurese de llenar todos los campos correctamente."
      redirect_to action: 'new'
    end
  end
  
  def index
    # returns all users except Admin
    @users = User.where.not(id: '0').order(username: :asc)
  end
  
  def show
    # redirect to edit
    @user = User.find(params[:id])
    redirect_to action: 'edit'
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    begin
      @user.update!(user_params(false))
      flash[:success] = "Usuario actualizado satisfactoriamente!"
    rescue ActiveRecord::RecordNotUnique
      flash[:error] = "Error! El nombre de usuario elegido, ya esta en uso."
    rescue ActiveRecord::RecordInvalid
      flash[:error] = "Error! Asegurese de llenar todos los campos."
    rescue
      flash[:error] = "Error! Asegurese de llenar todos los campos correctamente."
    end
    redirect_to action: 'edit'
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
