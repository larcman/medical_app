class AddReumatologiaFields < ActiveRecord::Migration[5.0]
  def change
    add_column :evaluations, :reuma_nad, :string
    add_column :evaluations, :reuma_nat, :string
    add_column :evaluations, :reuma_eva_enfermedad, :string
    add_column :evaluations, :reuma_eva_ddos, :string
    add_column :evaluations, :reuma_eva_medico, :string
    add_column :evaluations, :reuma_cdai, :string
    add_column :evaluations, :reuma_sdai, :string
  end
end