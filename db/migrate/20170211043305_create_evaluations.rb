class CreateEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations, :id => false do |t|
      t.string :id, null: false, primary_key: true
      t.string :var_fr
      t.string :var_acpa
      t.string :var_tnfa
      t.string :var_il6
      t.string :var_pcr
      t.string :var_das28
      t.string :var_vsg
      t.string :var_haq
      t.string :var_vop
      t.string :var_iac
      t.string :var_ic
      t.string :var_ta
      t.string :var_fc
      t.string :var_fr
      t.string :var_temp
      t.string :var_lip
      t.string :var_ct
      t.string :var_tg
      t.string :var_ldl
      t.string :var_vldl
      t.string :var_hdl
      t.string :var_glu
      t.string :var_peso
      t.string :var_talla
      t.string :var_imc
      t.string :var_cc
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE evaluations ALTER COLUMN id SET DEFAULT get_uuid();
        SQL
      end
      dir.down do
        execute <<-SQL
          ALTER TABLE evaluations ALTER COLUMN id DROP DEFAULT;
        SQL
      end
    end
  end
end
