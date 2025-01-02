class AddDefaultValueToRole < ActiveRecord::Migration[8.0]
  def change
    change_column :users, :role, 'Apprenant'
  end
end
