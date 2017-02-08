class AddCenterToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :center_id, :string, null: false

    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE "users" ADD CONSTRAINT "users_center_fk" FOREIGN KEY ("center_id") REFERENCES "centers" ("id");
        SQL
      end
    end
  end      
end