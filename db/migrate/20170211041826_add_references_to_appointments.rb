class AddReferencesToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_column :researches, :user_id, :string, null: false
    add_column :researches, :center_id, :string, null: false    
    
    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE "researches" ADD CONSTRAINT "researches_user_fk" FOREIGN KEY ("user_id") REFERENCES "users" ("id");
        SQL
        execute <<-SQL
          ALTER TABLE "researches" ADD CONSTRAINT "researches_center_fk" FOREIGN KEY ("center_id") REFERENCES "centers" ("id");
        SQL
      end
    end
  end
end