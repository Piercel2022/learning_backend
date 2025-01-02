class ChangeStatusDefaultInProgress < ActiveRecord::Migration[8.0]
  def change
    change_column_default :progresses, :status, from: nil, to: 'incomplete'
  end
end
