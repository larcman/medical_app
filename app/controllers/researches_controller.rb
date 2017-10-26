class ResearchesController < ApplicationController
  before_action :require_user
  
  def index
    if (params[:format])
      # Execute Query
      @records = []      
      @rows = Evaluation.select("
        people.code AS code_iirsme, patients.code, people.birthdate, people.age,
        people.p_diagnosisdate AS diagnosisdate, people.p_disease_startdate AS disease_startdate,

        appointments.day,
        evaluations.exp_fisica_tas AS tas, evaluations.exp_fisica_tad AS tad, evaluations.exp_fisica_tam AS tam,
        evaluations.var_fresp AS freq_resp, evaluations.var_fc AS freq_card, evaluations.var_temp AS temp,
        evaluations.var_talla, evaluations.var_peso, evaluations.var_imc,
        evaluations.nut_grasa_total, evaluations.var_cc, evaluations.nut_ccad,
        evaluations.dinam_der4a, evaluations.dinam_izq4a,
        evaluations.reuma_eva_enfermedad, evaluations.reuma_eva_ddos, evaluations.reuma_eva_medico,
        evaluations.reuma_cdai, evaluations.reuma_sdai, evaluations.var_haq, evaluations.reuma_nad,
        evaluations.reuma_nat, evaluations.var_vsg, evaluations.var_pcr, evaluations.var_das28,
        evaluations.var_das28pcr, evaluations.var_tg, evaluations.var_ldl, evaluations.var_hdl,
        evaluations.var_vldl, evaluations.qui_indice_aterosclerosis, evaluations.var_ct, evaluations.var_glu,
        evaluations.qui_apoa1, evaluations.qui_apob, evaluations.qui_tgoast, evaluations.qui_albumina,
        evaluations.var_fr, evaluations.lab_reuma_c3, evaluations.lab_reuma_c4, evaluations.var_il1, 
        evaluations.var_il6, evaluations.lab_reuma_antipad3, evaluations.lab_reuma_antipad4,
        evaluations.var_acpa, evaluations.var_tnfa, evaluations.lab_mol_dna, evaluations.lab_mol_rna,
        evaluations.lab_mol_mirna, 
        evaluations.car_artlab_qimt_izq, evaluations.car_artlab_qimt_der, evaluations.car_artlab_qimt_prom,
        evaluations.car_artlab_diametro1_izq, evaluations.car_artlab_diametro1_der,
        evaluations.car_artlab_qimtmax_izq, evaluations.car_artlab_qimtmax_der, 
        evaluations.car_artlab_distension_der, evaluations.car_artlab_diametro2_der, evaluations.car_artlab_distensibilidad_der,
        evaluations.car_artlab_psisbraquial_der, evaluations.car_artlab_pdiasbraquial_der, evaluations.car_artlab_psislocal_der,
        evaluations.car_artlab_pdiaslocal_der, evaluations.car_artlab_vop_der, evaluations.car_artlab_dc_der,
        evaluations.car_artlab_cc_der, evaluations.car_artlab_alfa_der, evaluations.car_artlab_beta_der,
        evaluations.car_artlab_icp_der, evaluations.car_artlab_ed_der, evaluations.car_artlab_p_der,
        evaluations.car_artlab_ap_der, evaluations.car_artlab_aix_der, evaluations.car_artlab_presenciaplaca_izq, evaluations.car_artlab_presenciaplaca_der,
        evaluations.car_pwv4a, evaluations.car_tt4a, evaluations.car_popscore4a,
        evaluations.car_vopcf, evaluations.car_aix, evaluations.car_presioncentral, evaluations.car_cpp,
        evaluations.car_ap, evaluations.car_ppas, evaluations.car_ppad, evaluations.car_percentil,
        evaluations.car_carfem, evaluations.car_caris, evaluations.car_isfem, evaluations.car_sevr,
        evaluations.car_cavi_izq, evaluations.car_cavi_der, evaluations.car_cavi_prom,
        evaluations.car_abi_izq, evaluations.car_abi_der
      ").
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
          r.code_iirsme = row.code_iirsme
          r.code_eeva = row.code
          r.birthdate = row.birthdate
          r.age = row.age
          r.diagnosisdate = row.diagnosisdate
          r.disease_startdate = row.disease_startdate
          
          r.day1 = row.day
          r.tas1 = row.tas
          r.tad1 = row.tad
          r.tam1 = row.tam
          r.freq_resp1 = row.freq_resp
          r.freq_card1 = row.freq_card
          r.temp1 = row.temp
        else 
          r.day2 = row.day
          r.tas2 = row.tas
          r.tad2 = row.tad
          r.tam2 = row.tam
          r.freq_resp2 = row.freq_resp
          r.freq_card2 = row.freq_card
          r.temp2 = row.temp
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
