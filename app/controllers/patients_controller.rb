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
      flash[:error] = "Error! La persona elegida ya es paciente de este protocolo."
    rescue
      flash[:error] = "Error! Asegurese de llenar todos los campos correctamente."
    end

    redirect_to controller: 'researches', action: 'show', id: @research.id
  end

  def show
    # redirect to edit
    @patient = Patient.find(params[:id])
    redirect_to action: 'edit', id: @patient.id
  end
  
  def edit
    @patient = Patient.find(params[:id])
    @research = @patient.research
    @center = Center.find(@research.center_id)    
    @appointments = @patient.appointments
    @people = Person.where("center_id = ?", @center.id);
  end
  
  def update
    @patient = Patient.find(params[:id])
    
    begin
      @patient.update!(patient_params)
      flash[:success] = "Paciente actualizado satisfactoriamente!"
    rescue ActiveRecord::RecordNotUnique
      flash[:error] = "Error! La persona elegida ya es paciente de este protocolo."
    rescue
      flash[:error] = "Error! Asegurese de llenar todos los campos correctamente."
    end

    redirect_to action: 'edit'
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
