class AddArcodeToPeople < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :arcode, :string
  end
end
