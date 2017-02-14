class PatientsController < ApplicationController
  before_action :require_user

  def new
    @patient = Patient.new
  end

  def index
  end

  def create
    quick_creation = params[:patient][:quick_creation]
    @research = Research.find(params[:patient][:research_id])
    @patient = Patient.new(patient_params)
    @patient.center_id = @research.center_id

    begin
      @patient.save!
      flash[:success] = "Paciente añadido al protocolo satisfactoriamente!"
    rescue ActiveRecord::RecordNotUnique
      flash[:error] = "Error! El codigo elegido ya esta en uso."
    rescue
      flash[:error] = "Error! Asegurese de llenar todos los campos correctamente."
    end

    redirect_to controller: 'researches', action: 'show', id: @research.id
  end

  def show
  end

  def edit
  end
  
  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
    redirect_to controller: 'researches', action: 'show', id: @patient.research_id
  end
  
  private
  def patient_params
    params.require(:patient).permit(:code, :person_id, :research_id)
  end
end
