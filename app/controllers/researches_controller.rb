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
    @owners = User.where("center_id = ? AND id <> '0'", @research.center_id)
      .order(username: :asc)
  end

  def update
    @research = Research.find(params[:id])
    @research.center_id = '0'
    begin
      @research.update!(research_params)
      flash[:success] = "Protocolo actualizado satisfactoriamente!"
    rescue ActiveRecord::RecordNotUnique
      flash[:error] = "Error! El codigo elegido para este protocolo ya esta en uso."
    rescue ActiveRecord::RecordInvalid
      flash[:error] = "Error! Asegurese de llenar todos los campos."
    rescue
      flash[:error] = "Error! Asegurese de llenar todos los campos correctamente."
    end
    redirect_to action: 'edit'
  end

  private
  def research_params
    params.require(:research).permit(:code, :name, :description, :user_id)
  end
end
