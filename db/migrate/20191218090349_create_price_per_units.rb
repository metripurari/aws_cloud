class CreatePricePerUnits < ActiveRecord::Migration[5.1]
  def change
    create_table :price_per_units do |t|
      t.string :unit
      t.string :price
      t.references :price_dimension, index: true, foreign_key: true
      t.timestamps
    end
  end
end
