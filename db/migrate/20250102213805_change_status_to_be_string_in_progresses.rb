class ChangeStatusToBeStringInProgresses < ActiveRecord::Migration[8.0]
  def up
    change_column :progresses, :status, :string
  end

  def down
    change_column :progresses, :status, :boolean
  end
end
