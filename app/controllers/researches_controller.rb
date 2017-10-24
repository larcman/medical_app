class ResearchesController < ApplicationController
  before_action :require_user
  
  def index
    if (params[:format])
      # Execute Query
      @records = []      
      @rows = Evaluation.select("patients.code, people.firstname, appointments.day").
      joins(appointment: {patient: :person}).
      where("appointments.status = 'Analisis Completo'").
      order("patients.id, appointments.day")
      
      # Order the records
      rows_count = 0
      prev_patient = ""
      _1st_round = true
      r = ReportRecord.new
      for row in @rows
        if prev_patient != row.code
          _1st_round = true
          if rows_count != 0
            @records << r
          end
          r = ReportRecord.new
          prev_patient = row.code
        else
          _1st_round = false
        end
        
        if _1st_round
          r.code = row.code
          r.firstname = row.firstname
        else 
          r.day = row.day
        end
        rows_count = rows_count + 1
      end
      @records << r
      
      # Write the records
      respond_to do |format|
        format.csv { send_data @records.to_csv }
        format.xls
      end

    else
      # TODO: Develop multi researches support
      # Develop view and disable option in menu
      # @researches = Research.all.order(created_at: :asc)
      redirect_to action: 'show', id: 0
    end
  end

  def show
    @research = Research.find(params[:id])
    @center = Center.find(@research.center_id)
    @patients = @research.patients.order(code: :asc)
    
    # Stuff for the Quick creation form
    @patient = Patient.new
    @people = Person.where("id NOT IN (SELECT person_id FROM patients WHERE research_id = ?)", @research.id).order(firstname: :asc);
  end

  def edit
    @research = Research.find(params[:id])
    @owners = User.where("center_id = ? AND id <> '0'", @research.center_id)
      .order(username: :asc)
  end

  def update
    @research = Research.find(params[:id])
    
    begin
      @research.update!(research_params)
      flash[:success] = "Protocolo actualizado satisfactoriamente!"
    rescue ActiveRecord::RecordNotUnique
      flash[:error] = "Error! El codigo elegido para este protocolo ya esta en uso."
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
