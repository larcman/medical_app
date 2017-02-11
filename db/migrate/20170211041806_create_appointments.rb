class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments, :id => false do |t|
      t.string :id, null: false, primary_key: true
      t.date :day, null: false
      t.time :starttime, null: false
      t.string :status, null: false
      t.text :comments
      t.timestamps
    end
    
    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE appointments ALTER COLUMN id SET DEFAULT get_uuid();
        SQL
      end
      dir.down do
        execute <<-SQL
          ALTER TABLE appointments ALTER COLUMN id DROP DEFAULT;
        SQL
      end
    end
  end
end