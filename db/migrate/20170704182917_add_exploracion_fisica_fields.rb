class AddExploracionFisicaFields < ActiveRecord::Migration[5.0]
  def change
    add_column :evaluations, :exp_fisica_tas, :string
    add_column :evaluations, :exp_fisica_tad, :string
    add_column :evaluations, :exp_fisica_tam, :string
  end
end
