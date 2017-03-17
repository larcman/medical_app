class AddArtlabFieldsToEvaluations < ActiveRecord::Migration[5.0]
  def change
    add_column :evaluations, :car_artlab_qimt_izq, :string
    add_column :evaluations, :car_artlab_qimt_der, :string    
    add_column :evaluations, :car_artlab_diametro1_izq, :string
    add_column :evaluations, :car_artlab_diametro1_der, :string    
    add_column :evaluations, :car_artlab_qimtmax_izq, :string
    add_column :evaluations, :car_artlab_qimtmax_der, :string
    add_column :evaluations, :car_artlab_distension_der, :string
    add_column :evaluations, :car_artlab_diametro2_der, :string
    add_column :evaluations, :car_artlab_psisbraquial_der, :string
    add_column :evaluations, :car_artlab_pdiasbraquial_der, :string
    add_column :evaluations, :car_artlab_psislocal_der, :string
    add_column :evaluations, :car_artlab_pdiaslocal_der, :string
    add_column :evaluations, :car_artlab_vop_der, :string
    add_column :evaluations, :car_artlab_dc_der, :string
    add_column :evaluations, :car_artlab_cc_der, :string
    add_column :evaluations, :car_artlab_alfa_der, :string
    add_column :evaluations, :car_artlab_beta_der, :string
    add_column :evaluations, :car_artlab_icp_der, :string
    add_column :evaluations, :car_artlab_ed_der, :string
    add_column :evaluations, :car_artlab_p_der, :string
    add_column :evaluations, :car_artlab_ap_der, :string
    add_column :evaluations, :car_artlab_aix_der, :string
    add_column :evaluations, :car_artlab_presenciaplaca_izq, :boolean, :default => false
    add_column :evaluations, :car_artlab_presenciaplaca_der, :boolean, :default => false
  end
end
