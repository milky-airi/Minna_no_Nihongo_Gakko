class ChangeColumnToCourses < ActiveRecord::Migration[6.1]

  def up
    change_column_null :courses, :capacity, true
  end

  def down
    change_column_null :courses, :capacity, false
  end

end
