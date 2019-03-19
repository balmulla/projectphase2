class AddDefaultActive < ActiveRecord::Migration[5.1]
  def change
    change_column_default :stores, :active, true
    change_column_default :employees, :active, true
  end
end
