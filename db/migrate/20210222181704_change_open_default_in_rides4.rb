class ChangeOpenDefaultInRides4 < ActiveRecord::Migration[5.2]
  def change
    change_column :rides, :open, :boolean, default: true, null: false
  end
end
