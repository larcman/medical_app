class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users, :id => false do |t|
      t.string :id, null: false, primary_key: true
      t.string :firstname, null: false
      t.string :lastname, null: false
      t.string :email, null: false
      t.string :username, null: false
      t.string :password_digest, null: false
      t.boolean :isadmin, null:false, :default => false
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE users ALTER COLUMN id SET DEFAULT get_uuid();
        SQL
        execute <<-SQL
          ALTER TABLE users ADD CONSTRAINT users_unique_username UNIQUE(username);
        SQL
      end
      dir.down do
        execute <<-SQL
          ALTER TABLE users ALTER COLUMN id DROP DEFAULT;
        SQL
        execute <<-SQL
          ALTER TABLE users DROP CONSTRAINT users_unique_username;
        SQL
      end
    end
  end
end
