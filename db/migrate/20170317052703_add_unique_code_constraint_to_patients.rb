class AddUniqueCodeConstraintToPatients < ActiveRecord::Migration[5.0]
  def change
    
    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE patients ADD CONSTRAINT patients_unique_codee UNIQUE(research_id, code);
        SQL
      end
      dir.down do
        execute <<-SQL
          ALTER TABLE patients DROP CONSTRAINT patients_unique_codee;
        SQL
      end
    end
  end
end
