class AddMedicamentosFieldsToPeople < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :meds1, :string
    add_column :people, :doses1, :string
    
    add_column :people, :meds2, :string
    add_column :people, :doses2, :string
    
    add_column :people, :meds3, :string
    add_column :people, :doses3, :string
    
    add_column :people, :meds4, :string
    add_column :people, :doses4, :string
    
    add_column :people, :meds5, :string
    add_column :people, :doses5, :string
    
    add_column :people, :meds6, :string
    add_column :people, :doses6, :string
    
    add_column :people, :meds7, :string
    add_column :people, :doses7, :string
  end
end