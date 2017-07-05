class AddReumatologiaMissingField < ActiveRecord::Migration[5.0]
  def change
    add_column :evaluations, :var_das28pcr, :string
  end
end
