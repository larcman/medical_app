class AddNewVariableToEvaluations < ActiveRecord::Migration[5.0]
  def change
    add_column :evaluations, :var_il1, :string
  end
end
