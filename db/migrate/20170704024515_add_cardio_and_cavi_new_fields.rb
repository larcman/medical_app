class AddCardioAndCaviNewFields < ActiveRecord::Migration[5.0]
  def change
    add_column :evaluations, :car_artlab_qimt_prom, :string
    add_column :evaluations, :car_artlab_distensibilidad_der, :string
    add_column :evaluations, :car_cavi_prom, :string
    add_column :evaluations, :car_abi_prom, :string
  end
end
