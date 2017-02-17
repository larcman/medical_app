class AddMissingColumnToEvaluations < ActiveRecord::Migration[5.0]
  def change
    add_column :evaluations, :var_fresp, :string
    add_column :evaluations, :research_id, :string, null: false

    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE "evaluations" ADD CONSTRAINT "evaluations_research_fk" FOREIGN KEY ("research_id") REFERENCES "researches" ("id");
        SQL
      end
    end
  end
end
