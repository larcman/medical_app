class ResearchesController < ApplicationController
  before_action :require_user
  
  def index
    @researches = Research.all.order(created_at: :asc)    
  end

  def show
    @research = Research.find(params[:id])
    @patients = @research.patients
  end

  def edit
    @research = Research.find(params[:id])
  end
end
