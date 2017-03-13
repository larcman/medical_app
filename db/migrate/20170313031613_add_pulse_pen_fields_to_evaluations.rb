class AddPulsePenFieldsToEvaluations < ActiveRecord::Migration[5.0]
  def change
    add_column :evaluations, :car_vopcf, :string
    add_column :evaluations, :car_aix, :string
    add_column :evaluations, :car_presioncentral, :string    
    add_column :evaluations, :car_cpp, :string  
    add_column :evaluations, :car_sevr, :string
    add_column :evaluations, :car_ap, :string
    add_column :evaluations, :car_ppas, :string
    add_column :evaluations, :car_ppad, :string
    add_column :evaluations, :car_percentil, :string
    add_column :evaluations, :car_carfem, :string
    add_column :evaluations, :car_caris, :string
    add_column :evaluations, :car_isfem, :string    
  end
end
