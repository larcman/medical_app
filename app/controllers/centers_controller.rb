class CentersController < ApplicationController
  before_action :require_user

  def index
    # TODO: Develop multi centers support
    # for now we have only one Medical Center
    redirect_to action: "show", id: 0
  end

  def show
    @center = Center.find(params[:id])
    @researches = @center.researches
  end

end
