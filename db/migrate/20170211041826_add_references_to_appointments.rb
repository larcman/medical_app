class AddReferencesToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :research_id, :string, null: false
    add_column :appointments, :patient_id, :string, null: false
    add_column :appointments, :center_id, :string, null: false    
    
    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE "appointments" ADD CONSTRAINT "appointments_research_fk" FOREIGN KEY ("research_id") REFERENCES "researches" ("id");
        SQL
        execute <<-SQL
          ALTER TABLE "appointments" ADD CONSTRAINT "appointments_patient_fk" FOREIGN KEY ("patient_id") REFERENCES "patients" ("id");
        SQL
        execute <<-SQL
          ALTER TABLE "appointments" ADD CONSTRAINT "appointments_center_fk" FOREIGN KEY ("center_id") REFERENCES "centers" ("id");
        SQL
      end
    end
  end
end