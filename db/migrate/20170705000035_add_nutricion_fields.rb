class AddNutricionFields < ActiveRecord::Migration[5.0]
  def change
    add_column :evaluations, :nut_grasa_total, :string
    add_column :evaluations, :nut_ccad, :string
  end
end
