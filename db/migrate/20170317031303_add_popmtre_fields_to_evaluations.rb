class AddPopmtreFieldsToEvaluations < ActiveRecord::Migration[5.0]
  def change
    add_column :evaluations, :car_pwv1a, :string
    add_column :evaluations, :car_pwv2a, :string
    add_column :evaluations, :car_pwv3a, :string
    add_column :evaluations, :car_pwv4a, :string
    add_column :evaluations, :car_tt1a, :string
    add_column :evaluations, :car_tt2a, :string
    add_column :evaluations, :car_tt3a, :string
    add_column :evaluations, :car_tt4a, :string
    add_column :evaluations, :car_popscore1a, :string
    add_column :evaluations, :car_popscore2a, :string
    add_column :evaluations, :car_popscore3a, :string
    add_column :evaluations, :car_popscore4a, :string
  end
end
