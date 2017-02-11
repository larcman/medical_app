class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people, :id => false do |t|
      t.string :id, null: false, primary_key: true
      t.string :code, null: false
      t.date :elaborationdate, null: false
      t.string :firstname, null: false
      t.string :lastname, null: false
      t.date :birthdate
      t.integer :age
      t.string :gender
      t.string :maritalstatus
      t.string :occupation
      t.string :education
      t.string :birthplace
      t.string :address1
      t.string :address2
      t.string :region
      t.string :zipcode
      t.string :city
      t.string :state
      t.string :phone
      t.string :cellphone
      t.string :email
      t.timestamps
    end
    
    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE people ALTER COLUMN id SET DEFAULT get_uuid();
        SQL
        execute <<-SQL
          ALTER TABLE people ADD CONSTRAINT people_unique_code UNIQUE(code);
        SQL
      end
      dir.down do
        execute <<-SQL
          ALTER TABLE people ALTER COLUMN id DROP DEFAULT;
        SQL
        execute <<-SQL
          ALTER TABLE people DROP CONSTRAINT people_unique_code;
        SQL
      end
    end
  end
end
