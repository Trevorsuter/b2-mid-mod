class CreateParks < ActiveRecord::Migration[5.2]
  def change
    create_table :parks do |t|
      t.string :name
      t.decimal :admissions, precision: 10, scale: 2
    end
  end
end
