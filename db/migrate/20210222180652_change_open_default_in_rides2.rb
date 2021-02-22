class ChangeOpenDefaultInRides2 < ActiveRecord::Migration[5.2]
  def change
    change_column :rides, :open, :boolean, default: nil
  end
end
