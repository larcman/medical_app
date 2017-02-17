class AppointmentsController < ApplicationController
  before_action :require_user
  
  def new
    @appointment = Appointment.new
    @patient = Patient.find(params[:patient_id])
    @research = @patient.research
  end
  
  def create
    quick_creation = params[:appointment][:quick_creation]
    @patient = Patient.find(params[:appointment][:patient_id])
    @appointment = Appointment.new(appointment_params)
    @appointment.research_id = @patient.research_id
    @appointment.center_id = @patient.center_id

    begin
      @appointment.save!
      flash[:success] = "Visita agendada satisfactoriamente!"
    rescue
      flash[:error] = "Error! Asegurese de llenar todos los campos correctamente."
    end

    redirect_to controller: 'patients', action: 'edit', id: @patient.id
  end
  
  def show
    # redirect to edit
    @appointment = Appointment.find(params[:id])
    redirect_to action: 'edit', id: @appointment.id
  end

  def edit
    @appointment = Appointment.find(params[:id])
    @research = @appointment.research
    
    if @appointment.evaluation
      @evaluation = @appointment.evaluation
    end
  end
  
  def update
    @appointment = Appointment.find(params[:id])
    
    begin
      @appointment.update!(appointment_params)
      flash[:success] = "Visita actualizada satisfactoriamente!"
    rescue
      flash[:error] = "Error! Asegurese de llenar todos los campos correctamente."
    end

    redirect_to action: 'edit'
  end  
  
  def destroy
    @appointment = Appointment.find(params[:id])
    patient = @appointment.patient
    @appointment.destroy
    redirect_to controller: 'patients', action: 'edit', id: patient.id
  end  
  
  private
  def appointment_params
    params.require(:appointment).permit(:day, :starttime, :status, :comments, :patient_id)
  end
end
