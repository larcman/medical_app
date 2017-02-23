class PeopleController < ApplicationController
  before_action :require_user

  def new
    @person = Person.new
  end
  
  def create
    @person = Person.new(person_params)
    user = User.find(session[:user_id])
    @person.center_id = user.center_id

    begin
      @person.save!
      redirect_to action: 'index'
    rescue ActiveRecord::RecordNotUnique
      flash[:error] = "Error! El codigo IIRSME elegido ya esta en uso."
      redirect_to action: 'new'
    rescue
      flash[:error] = "Error! Asegurese de llenar todos los campos correctamente."
      redirect_to action: 'new'
    end
  end
  
  def index
    user = User.find(session[:user_id])
    @people = Person.where("center_id = ?", user.center_id).order(code: :asc)
  end

  def show
    # redirect to edit
    @person = Person.find(params[:id])
    redirect_to action: 'edit'
  end
  
  def edit
    @person = Person.find(params[:id])
  end
  
  def update
    @person = Person.find(params[:id])

    begin
      @person.update!(person_params)
      flash[:success] = "Candidato actualizado satisfactoriamente!"
    rescue ActiveRecord::RecordNotUnique
      flash[:error] = "Error! El codigo IIRSME elegido ya esta en uso."
    rescue
      flash[:error] = "Error! Asegurese de llenar todos los campos correctamente."
    end
    
    redirect_to action: 'edit'
  end

  def destroy
    @person = Person.find(params[:id])
    
    begin
      @person.destroy
    rescue ActiveRecord::InvalidForeignKey
      flash[:error] = "Este candidato es paciente de al menos un protocolo.
      Elimine todos los pacientes ligados a este candidato e intente de nuevo."
    end
    
    redirect_to action: 'index'
  end
  
  private
  def person_params
    params.require(:person).permit(:code, :arcode, :elaborationdate, :firstname, :lastname, 
      :birthdate, :age, :gender, :maritalstatus, :occupation, :education, :birthplace, 
      :address1, :address2, :region, :zipcode, :city, :state, :phone, :cellphone, :email,
      :health_status, :obesity, :dm2, :hta, :ecv, :iam, :irc, :evc, :cancer, :hypercholesterolemia)
  end
end
