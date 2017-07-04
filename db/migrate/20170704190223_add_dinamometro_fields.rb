class AddDinamometroFields < ActiveRecord::Migration[5.0]
  def change
    add_column :evaluations, :dinam_der1a, :string
    add_column :evaluations, :dinam_der2a, :string
    add_column :evaluations, :dinam_der3a, :string
    add_column :evaluations, :dinam_der4a, :string
    add_column :evaluations, :dinam_izq1a, :string
    add_column :evaluations, :dinam_izq2a, :string
    add_column :evaluations, :dinam_izq3a, :string
    add_column :evaluations, :dinam_izq4a, :string
  end
end
