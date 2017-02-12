class CreateCenters < ActiveRecord::Migration[5.0]
  def change
    create_table :centers, :id => false do |t|
      t.string :id, null: false, primary_key: true
      t.string :code, null: false
      t.string :name, null: false
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE centers ALTER COLUMN id SET DEFAULT get_uuid();
        SQL
        execute <<-SQL
          ALTER TABLE centers ADD CONSTRAINT centers_unique_code UNIQUE(code);
        SQL
      end
      dir.down do
        execute <<-SQL
          ALTER TABLE centers ALTER COLUMN id DROP DEFAULT;
        SQL
        execute <<-SQL
          ALTER TABLE centers DROP CONSTRAINT centers_unique_code;
        SQL
      end
    end
  end
end
