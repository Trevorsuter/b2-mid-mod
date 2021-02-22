class ChangeOpenDefaultInRides < ActiveRecord::Migration[5.2]
  def change
    change_column :rides, :open, :boolean
  end
end
