class AddAntecedentesPatologicosFieldsToPeople < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :p_medications, :string
    add_column :people, :p_smoking, :string
    add_column :people, :p_alcoholism, :string
    add_column :people, :p_addictions, :string

    add_column :people, :p_obesity, :string
    add_column :people, :p_dm2, :string
    add_column :people, :p_hta, :string
    add_column :people, :p_ecv, :string
    add_column :people, :p_iam, :string
    add_column :people, :p_irc, :string
    add_column :people, :p_evc, :string
    add_column :people, :p_cancer, :string
    add_column :people, :p_hypercholesterolemia, :string

    add_column :people, :p_antobst, :string
    add_column :people, :p_menarche, :string
    add_column :people, :p_ritmo, :string
    add_column :people, :p_fum, :string
    add_column :people, :p_hormones, :string

    add_column :people, :p_diagnosisdate, :string
    add_column :people, :p_disease_startdate, :string
  end
end
