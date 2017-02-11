class AddReferencesToEvaluations < ActiveRecord::Migration[5.0]
  def change
    add_column :evaluations, :appointment_id, :string, null: false
    add_column :evaluations, :center_id, :string, null: false

    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE "evaluations" ADD CONSTRAINT "evaluations_appointment_fk" FOREIGN KEY ("appointment_id") REFERENCES "appointments" ("id");
        SQL
        execute <<-SQL
          ALTER TABLE "evaluations" ADD CONSTRAINT "evaluations_center_fk" FOREIGN KEY ("center_id") REFERENCES "centers" ("id");
        SQL
      end
    end
  end
end
