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
        evaluations.var_talla AS talla, evaluations.var_peso AS peso, evaluations.var_imc AS imc,
        evaluations.nut_grasa_total AS grasa, evaluations.var_cc AS ccin, evaluations.nut_ccad AS ccad,
        evaluations.dinam_der4a AS prom_der, evaluations.dinam_izq4a AS prom_izq,
        evaluations.reuma_eva_enfermedad AS eva_enf, evaluations.reuma_eva_ddos AS eva_dolor, evaluations.reuma_eva_medico AS eva_medico,
        evaluations.reuma_cdai AS cdai, evaluations.reuma_sdai AS sdai, evaluations.var_haq AS haq, evaluations.reuma_nad AS nad,
        evaluations.reuma_nat AS nat, evaluations.var_vsg AS vsg, evaluations.var_pcr AS pcr, evaluations.var_das28 AS das28,
        evaluations.var_das28pcr AS das28pcr, evaluations.var_tg AS tg, evaluations.var_ldl AS ldl, evaluations.var_hdl AS hdl,
        evaluations.var_vldl AS vldl, evaluations.qui_indice_aterosclerosis AS indice_ar, evaluations.var_ct AS ct, evaluations.var_glu AS glu,
        evaluations.qui_apoa1 AS apoa1, evaluations.qui_apob AS apob, evaluations.qui_tgoast AS tgoast, evaluations.qui_albumina AS albumina,
        evaluations.var_fr AS fr, evaluations.lab_reuma_c3 AS c3, evaluations.lab_reuma_c4 AS c4, evaluations.var_il1 AS il1,
        evaluations.var_il6 AS il6, evaluations.lab_reuma_antipad3 AS antipad3, evaluations.lab_reuma_antipad4 AS antipad4,
        evaluations.var_acpa AS acpa, evaluations.var_tnfa AS tnfa, evaluations.lab_mol_dna AS dna, evaluations.lab_mol_rna AS rna,
        evaluations.lab_mol_mirna AS mirna,
        evaluations.car_artlab_qimt_izq AS qimt_izq, evaluations.car_artlab_qimt_der AS qimt_der, evaluations.car_artlab_qimt_prom AS qimt_prom,
        evaluations.car_artlab_diametro1_izq AS diam_izq, evaluations.car_artlab_diametro1_der AS diam_der,
        evaluations.car_artlab_qimtmax_izq AS qimtmax_izq, evaluations.car_artlab_qimtmax_der AS qimtmax_der, 
        evaluations.car_artlab_distension_der AS distension, evaluations.car_artlab_diametro2_der AS diametro, evaluations.car_artlab_distensibilidad_der AS distensibilidad,
        evaluations.car_artlab_psisbraquial_der AS psisbraq, evaluations.car_artlab_pdiasbraquial_der AS pdiasbraq, evaluations.car_artlab_psislocal_der AS psislocal,
        evaluations.car_artlab_pdiaslocal_der AS pdiaslocal, evaluations.car_artlab_vop_der AS vo, evaluations.car_artlab_dc_der AS dc,
        evaluations.car_artlab_cc_der AS cc, evaluations.car_artlab_alfa_der AS alfa, evaluations.car_artlab_beta_der AS beta,
        evaluations.car_artlab_icp_der AS icp, evaluations.car_artlab_ed_der AS ed, evaluations.car_artlab_p_der AS p_,
        evaluations.car_artlab_ap_der AS ap, evaluations.car_artlab_aix_der AS aix, evaluations.car_artlab_presenciaplaca_izq AS placa_izq, evaluations.car_artlab_presenciaplaca_der AS placa_der,
        evaluations.car_pwv4a AS pwv, evaluations.car_tt4a AS ttp, evaluations.car_popscore4a AS pop,
        evaluations.car_vopcf AS vopcf, evaluations.car_aix AS aixx, evaluations.car_presioncentral AS presion_cent, evaluations.car_cpp AS ccp,
        evaluations.car_ap AS app, evaluations.car_ppas AS ppas, evaluations.car_ppad AS ppad, evaluations.car_percentil AS percentil,
        evaluations.car_carfem AS carfem, evaluations.car_caris AS caris, evaluations.car_isfem AS isfem, evaluations.car_sevr AS sevr,
        evaluations.car_cavi_izq AS cavii, evaluations.car_cavi_der AS cavid, evaluations.car_cavi_prom AS cavi_prom,
        evaluations.car_abi_izq AS abii, evaluations.car_abi_der AS abid
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
          r.talla1 = row.talla
          r.peso1 = row.peso
          r.imc1 = row.imc
          r.grasa1 = row.grasa
          r.ccin1 = row.ccin
          r.ccad1 = row.ccad
          r.prom_izq1 = row.prom_izq
          r.prom_der1 = row.prom_der
          r.eva_enf1 = row.eva_enf
          r.eva_dolor1 = row.eva_dolor
          r.eva_medico1 = row.eva_medico
          r.cdai1 = row.cdai
          r.sdai1 = row.sdai
          r.haq1 = row.haq
          r.nad1 = row.nad
          r.nat1 = row.nat
          r.vsg1 = row.vsg
          r.pcr1 = row.pcr
          r.das28_1 = row.das28
          r.das28pcr1 = row.das28pcr
          r.tg1 = row.tg
          r.ldl1 = row.ldl
          r.hdl1 = row.hdl
          r.vldl1 = row.vldl
          r.indice_ar1 = row.indice_ar
          r.ct1 = row.ct
          r.glu1 = row.glu
          r.apoa1_1 = row.apoa1
          r.apob1 = row.apob
          r.tgoast1 = row.tgoast
          r.albumina1 = row.albumina
          r.fr1 = row.fr
          r.c3_1 = row.c3
          r.c4_1 = row.c4
          r.il1_1 = row.il1
          r.il6_1 = row.il6
          r.antipad3_1 = row.antipad3
          r.antipad4_1 = row.antipad4
          r.acpa1 = row.acpa
          r.tnfa1 = row.tnfa
          r.dna1 = row.dna
          r.rna1 = row.rna
          r.mirna1 = row.mirna
          r.qimt_izq1 = row.qimt_izq
          r.qimt_der1 = row.qimt_der
          r.qimt_prom1 = row.qimt_prom
          r.diam_izq1 = row.diam_izq
          r.diam_der1 = row.diam_der
          
          r.qimtmax_izq1 = row.qimtmax_izq
          r.qimtmax_der1 = row.qimtmax_der
          
          r.distension1 = row.distension
          r.diametro1 = row.diametro
          r.distensibilidad1 = row.distensibilidad
          r.psisbraq1 = row.psisbraq
          r.pdiasbraq1 = row.pdiasbraq
          r.psislocal1 = row.psislocal
          r.pdiaslocal1 = row.pdiaslocal
          r.vo1 = row.vo
          r.dc1 = row.dc
          r.cc1 = row.cc
          r.alfa1 = row.alfa
          r.beta1 = row.beta
          r.icp1 = row.icp
          r.ed1 = row.ed
          r.p1 = row.p_
          r.ap1 = row.ap
          r.aix1 = row.aix
          r.placa_izq1 = row.placa_izq
          r.placa_der1 = row.placa_der
          r.pwv1 = row.pwv
          r.ttp1 = row.ttp
          r.pop1 = row.pop
          r.vopcf1 = row.vopcf
          r.aixx1 = row.aixx
          r.presion_cent1 = row.presion_cent
          r.ccp1 = row.ccp
          r.app1 = row.app
          r.ppas1 = row.ppas
          r.ppad1 = row.ppad
          r.percentil1 = row.percentil
          r.carfem1 = row.carfem
          r.caris1 = row.caris
          r.isfem1 = row.isfem
          r.sevr1 = row.sevr
          r.cavii1 = row.cavii
          r.cavid1 = row.cavid
          r.cavi_prom1 = row.cavi_prom
          r.abii1 = row.abii
          r.abid1 = row.abid
          
        else 
          r.day2 = row.day
          r.tas2 = row.tas
          r.tad2 = row.tad
          r.tam2 = row.tam
          r.freq_resp2 = row.freq_resp
          r.freq_card2 = row.freq_card
          r.temp2 = row.temp
          r.talla2 = row.talla
          r.peso2 = row.peso
          r.imc2 = row.imc
          r.grasa2 = row.grasa
          r.ccin2 = row.ccin
          r.ccad2 = row.ccad
          r.prom_izq2 = row.prom_izq
          r.prom_der2 = row.prom_der
          r.eva_enf2 = row.eva_enf
          r.eva_dolor2 = row.eva_dolor
          r.eva_medico2 = row.eva_medico
          r.cdai2 = row.cdai
          r.sdai2 = row.sdai
          r.haq2 = row.haq
          r.nad2 = row.nad
          r.nat2 = row.nat
          r.vsg2 = row.vsg
          r.pcr2 = row.pcr
          r.das28_2 = row.das28
          r.das28pcr2 = row.das28pcr
          r.tg2 = row.tg
          r.ldl2 = row.ldl
          r.hdl2 = row.hdl
          r.vldl2 = row.vldl
          r.indice_ar2 = row.indice_ar
          r.ct2 = row.ct
          r.glu2 = row.glu
          r.apoa1_2 = row.apoa1
          r.apob2 = row.apob
          r.tgoast2 = row.tgoast
          r.albumina2 = row.albumina
          r.fr2 = row.fr
          r.c3_2 = row.c3
          r.c4_2 = row.c4
          r.il1_2 = row.il1
          r.il6_2 = row.il6
          r.antipad3_2 = row.antipad3
          r.antipad4_2 = row.antipad4
          r.acpa2 = row.acpa
          r.tnfa2 = row.tnfa
          r.dna2 = row.dna
          r.rna2 = row.rna
          r.mirna2 = row.mirna
          r.qimt_izq2 = row.qimt_izq
          r.qimt_der2 = row.qimt_der
          r.qimt_prom2 = row.qimt_prom
          r.diam_izq2 = row.diam_izq
          r.diam_der2 = row.diam_der
          
          r.qimtmax_izq2 = row.qimtmax_izq
          r.qimtmax_der2 = row.qimtmax_der
          
          r.distension2 = row.distension
          r.diametro2 = row.diametro
          r.distensibilidad2 = row.distensibilidad
          r.psisbraq2 = row.psisbraq
          r.pdiasbraq2 = row.pdiasbraq
          r.psislocal2 = row.psislocal
          r.pdiaslocal2 = row.pdiaslocal
          r.vo2 = row.vo
          r.dc2 = row.dc
          r.cc2 = row.cc
          r.alfa2 = row.alfa
          r.beta2 = row.beta
          r.icp2 = row.icp
          r.ed2 = row.ed
          r.p2 = row.p_
          r.ap2 = row.ap
          r.aix2 = row.aix
          r.placa_izq2 = row.placa_izq
          r.placa_der2 = row.placa_der
          r.pwv2 = row.pwv
          r.ttp2 = row.ttp
          r.pop2 = row.pop
          r.vopcf2 = row.vopcf
          r.aixx2 = row.aixx
          r.presion_cent2 = row.presion_cent
          r.ccp2 = row.ccp
          r.app2 = row.app
          r.ppas2 = row.ppas
          r.ppad2 = row.ppad
          r.percentil2 = row.percentil
          r.carfem2 = row.carfem
          r.caris2 = row.caris
          r.isfem2 = row.isfem
          r.sevr2 = row.sevr
          r.cavii2 = row.cavii
          r.cavid2 = row.cavid
          r.cavi_prom2 = row.cavi_prom
          r.abii2 = row.abii
          r.abid2 = row.abid

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
