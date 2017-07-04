class AddLaboratorialesReumatologiaFields < ActiveRecord::Migration[5.0]
  def change
    add_column :evaluations, :lab_reuma_c3, :string
    add_column :evaluations, :lab_reuma_c4, :string
    add_column :evaluations, :lab_reuma_antipad3, :string
    add_column :evaluations, :lab_reuma_antipad4, :string
  end
end
