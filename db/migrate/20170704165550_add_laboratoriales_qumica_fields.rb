class AddLaboratorialesQumicaFields < ActiveRecord::Migration[5.0]
  def change
    add_column :evaluations, :qui_indice_aterosclerosis, :string
    add_column :evaluations, :qui_apoa1, :string
    add_column :evaluations, :qui_apob, :string
    add_column :evaluations, :qui_tgoast, :string
    add_column :evaluations, :qui_albumina, :string
  end
end
