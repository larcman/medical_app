class EvaluationsController < ApplicationController
  before_action :require_user
  
  def new
    @evaluation = Evaluation.new
    @appointment = Appointment.find(params[:appointment_id])
    @research = @appointment.research
  end
  
  def create
    @appointment = Appointment.find(params[:evaluation][:appointment_id])
    @evaluation = Evaluation.new(evaluation_params)
    @evaluation.appointment_id = @appointment.id
    @evaluation.research_id = @appointment.research_id
    @evaluation.center_id = @appointment.center_id

    begin
      @evaluation.save!
      flash[:success] = "Evaluación creada satisfactoriamente!"
    rescue
      flash[:error] = "Error! Asegurese de llenar todos los campos correctamente."
    end

    redirect_to controller: 'appointments', action: 'edit', id: @appointment.id
  end
  
  def show
    # redirect to edit
    @evaluation = Evaluation.find(params[:id])
    redirect_to action: 'edit', id: @evaluation.id
  end

  def edit
    @evaluation = Evaluation.find(params[:id])
    @research = @evaluation.research
  end
  
  def update
    @evaluation = Evaluation.find(params[:id])
    
    begin
      @evaluation.update!(evaluation_params)
      flash[:success] = "Evaluación actualizada satisfactoriamente!"
    rescue
      flash[:error] = "Error! Asegurese de llenar todos los campos correctamente."
    end

    redirect_to action: 'edit'
  end
  
  def destroy
    @evaluation = Evaluation.find(params[:id])
    appointment = @evaluation.appointment
    
    begin
      @evaluation.destroy
      flash[:success] = "Evaluación eliminada satisfactoriamente!"
    rescue
      flash[:error] = "Error! Hubo un error al eliminar la evaluación, intente nuevamente."
    end
    
    redirect_to controller: 'appointments', action: 'edit', id: appointment.id
  end
  
  private
  def evaluation_params
    params.require(:evaluation).permit(
    # Variables (General)
    :var_fr, :var_acpa, :var_tnfa, :var_il1, :var_il6, :var_pcr, :var_das28, 
    :var_vsg, :var_haq, :var_vop, :var_iac, :var_ic, :var_ta, :var_fc, :var_fresp, :var_temp, :var_lip,
    :var_ct, :var_tg, :var_ldl, :var_vldl, :var_hdl, :var_glu, :var_peso, :var_talla, :var_imc, :var_cc,
    # Cardiovascular
    ## Artlab
    :car_artlab_qimt_izq, :car_artlab_qimt_der, :car_artlab_diametro1_izq, :car_artlab_diametro1_der,
    :car_artlab_qimtmax_izq, :car_artlab_qimtmax_der, :car_artlab_distension_der, :car_artlab_diametro2_der,
    :car_artlab_psisbraquial_der, :car_artlab_pdiasbraquial_der, :car_artlab_psislocal_der, :car_artlab_pdiaslocal_der,
    :car_artlab_vop_der, :car_artlab_dc_der, :car_artlab_cc_der, :car_artlab_alfa_der, :car_artlab_beta_der,
    :car_artlab_icp_der, :car_artlab_ed_der, :car_artlab_p_der, :car_artlab_ap_der, :car_artlab_aix_der,
    :car_artlab_presenciaplaca_izq, :car_artlab_presenciaplaca_der,
    ## pOpmtre
    :car_pwv1a, :car_pwv2a, :car_pwv3a, :car_pwv4a,
    :car_tt1a, :car_tt2a, :car_tt3a, :car_tt4a,
    ## PulsePen
    :car_popscore1a, :car_popscore2a, :car_popscore3a, :car_popscore4a,
    :car_vopcf, :car_ap, :car_carfem, :car_aix, :car_ppas, :car_caris, :car_presioncentral, 
    :car_ppad, :car_isfem, :car_cpp, :car_percentil, :car_sevr
    )
  end  
  
end
