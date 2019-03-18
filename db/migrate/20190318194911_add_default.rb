class AddDefault < ActiveRecord::Migration[5.1]
  def change
    change_column_default :stores, :state, "PA"
  end
end
