class ChangeColumnToNull < ActiveRecord::Migration[6.1]

  def up
    change_column_null :schools, :summary, true
  end

  def down
    change_column_null :schools, :summary, false
  end


end
