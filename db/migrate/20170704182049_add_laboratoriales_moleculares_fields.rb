class AddLaboratorialesMolecularesFields < ActiveRecord::Migration[5.0]
  def change
    add_column :evaluations, :lab_mol_dna, :string
    add_column :evaluations, :lab_mol_rna, :string
    add_column :evaluations, :lab_mol_mirna, :string
  end
end
