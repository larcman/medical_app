class AddUniqueConstraintToPatients < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE patients DROP CONSTRAINT IF EXISTS patients_unique_code;
        SQL
        execute <<-SQL
          ALTER TABLE patients ADD CONSTRAINT patients_unique_person_research UNIQUE(person_id, research_id);
        SQL
      end
      dir.down do
        execute <<-SQL
          ALTER TABLE patients DROP CONSTRAINT patients_unique_person_research;
        SQL
      end
    end
  end
end