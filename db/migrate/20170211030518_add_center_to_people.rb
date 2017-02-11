class AddCenterToPeople < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :center_id, :string, null: false

    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE "people" ADD CONSTRAINT "people_center_fk" FOREIGN KEY ("center_id") REFERENCES "centers" ("id");
        SQL
      end
    end
  end      
end
