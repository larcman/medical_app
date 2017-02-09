class CentersController < ApplicationController
before_action :require_user
  def index
    @centers = Center.all
  end

  def show
    @center = Center.find(params[:id])
    @users = @center.users
  end

end
