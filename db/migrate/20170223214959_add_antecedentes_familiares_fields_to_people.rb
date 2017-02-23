class AddAntecedentesFamiliaresFieldsToPeople < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :health_status, :string
    add_column :people, :obesity, :string
    add_column :people, :dm2, :string
    add_column :people, :hta, :string
    add_column :people, :ecv, :string
    add_column :people, :iam, :string
    add_column :people, :irc, :string
    add_column :people, :evc, :string
    add_column :people, :cancer, :string
    add_column :people, :hypercholesterolemia, :string
  end
end