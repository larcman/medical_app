class AddReferencesToPatients < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :research_id, :string, null: false
    add_column :patients, :person_id, :string, null: false
    add_column :patients, :center_id, :string, null: false

    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE "patients" ADD CONSTRAINT "patients_researches_fk" FOREIGN KEY ("research_id") REFERENCES "researches" ("id");
        SQL
        execute <<-SQL
          ALTER TABLE "patients" ADD CONSTRAINT "patients_people_fk" FOREIGN KEY ("person_id") REFERENCES "people" ("id");
        SQL
        execute <<-SQL
          ALTER TABLE "patients" ADD CONSTRAINT "patients_center_fk" FOREIGN KEY ("center_id") REFERENCES "centers" ("id");
        SQL
      end
    end
  end
end
