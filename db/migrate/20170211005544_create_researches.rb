class CreateResearches < ActiveRecord::Migration[5.0]
  def change
    create_table :researches, :id => false do |t|
      t.string :id, null: false, primary_key: true
      t.string :code, null: false
      t.string :name, null: false
      t.text :description
      t.reference :user_id, :string, null: false
      t.reference :center_id, :string, null: false
      t.timestamps
    end
    
    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE researches ALTER COLUMN id SET DEFAULT get_uuid();
        SQL
        execute <<-SQL
          ALTER TABLE researches ADD CONSTRAINT researches_unique_code UNIQUE(code);
        SQL
        execute <<-SQL
          ALTER TABLE "researches" ADD CONSTRAINT "researches_user_fk" FOREIGN KEY ("user_id") REFERENCES "users" ("id");
        SQL
        execute <<-SQL
          ALTER TABLE "researches" ADD CONSTRAINT "researches_center_fk" FOREIGN KEY ("center_id") REFERENCES "centers" ("id");
        SQL
      end
      dir.down do
        execute <<-SQL
          ALTER TABLE researches ALTER COLUMN id DROP DEFAULT;
        SQL
        execute <<-SQL
          ALTER TABLE researches DROP CONSTRAINT researches_unique_code;
        SQL
      end
    end    
  end
end
