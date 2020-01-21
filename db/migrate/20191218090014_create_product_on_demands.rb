class CreateProductOnDemands < ActiveRecord::Migration[5.1]
  def change
    create_table :product_on_demands do |t|
      t.string :offerTermCode
      t.datetime :effectiveDate
      t.references :aws_amazon_cloud_product, index: true, foreign_key: true
      t.timestamps
    end
  end
end
