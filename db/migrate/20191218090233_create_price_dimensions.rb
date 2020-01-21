class CreatePriceDimensions < ActiveRecord::Migration[5.1]
  def change
    create_table :price_dimensions do |t|
      t.string :rateCode
      t.string :description
      t.string :beginRange
      t.string :endRange
      t.string :unit
      t.references :product_on_demand, index: true, foreign_key: true

      t.timestamps
    end
  end
end
