class AddSeguimientoFieldsToEvaluations < ActiveRecord::Migration[5.0]
  def change
    add_column :evaluations, :seg_peso, :string
    add_column :evaluations, :seg_talla, :string
    add_column :evaluations, :seg_imc, :string
    add_column :evaluations, :seg_body_fat, :string
    add_column :evaluations, :seg_abdominal_girth, :string
    add_column :evaluations, :seg_fc, :string
    add_column :evaluations, :seg_fr, :string
    add_column :evaluations, :seg_ta1, :string
    add_column :evaluations, :seg_ta2, :string
    add_column :evaluations, :seg_waist_circumference, :string
    add_column :evaluations, :seg_firstdose_date, :date
    add_column :evaluations, :seg_lastdose_date, :date
    add_column :evaluations, :seg_missed_dose, :boolean, :default => false
    add_column :evaluations, :seg_missed_details, :string
    add_column :evaluations, :seg_medicament_count, :string
    add_column :evaluations, :seg_event_description, :text
  end
end

