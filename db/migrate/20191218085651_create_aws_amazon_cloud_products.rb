class CreateAwsAmazonCloudProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :aws_amazon_cloud_products do |t|
      t.string :sku
      t.string :productFamily
      t.string :servicecode
      t.string :location
      t.string :locationType
      t.string :usagetype
      t.string :operation
      t.string :requestDescription
      t.string :requestType
      t.string :servicename
      t.string :transferType
      t.string :fromLocation
      t.string :fromLocationType
      t.string :toLocationType
      t.string :toLocation
      t.string :group
      t.string :groupDescription
      t.references :aws_amazon_cloud, index: true, foreign_key: true

      t.timestamps
    end
  end
end
