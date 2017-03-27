class AddCaviFieldsToEvaluations < ActiveRecord::Migration[5.0]
  def change
    add_column :evaluations, :car_cavi_der, :string
    add_column :evaluations, :car_cavi_izq, :string
    add_column :evaluations, :car_abi_der, :string
    add_column :evaluations, :car_abi_izq, :string
  end
end
