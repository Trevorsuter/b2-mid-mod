class ChangeOpenInRides < ActiveRecord::Migration[5.2]
  def change
    change_column :rides, :open, :boolean, default: true
  end
end
