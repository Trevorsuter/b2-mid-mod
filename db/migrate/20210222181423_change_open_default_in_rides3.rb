class ChangeOpenDefaultInRides3 < ActiveRecord::Migration[5.2]
  def change
    change_column :rides, :open, :boolean, default: false
  end
end
