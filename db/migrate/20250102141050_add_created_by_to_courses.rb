class AddCreatedByToCourses < ActiveRecord::Migration[8.0]
  def change
    add_reference :courses, :created_by, null: false, foreign_key: { to_table: :users }
  end
end
