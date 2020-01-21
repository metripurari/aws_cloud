class CreateAwsAmazonClouds < ActiveRecord::Migration[5.1]
  def change
    create_table :aws_amazon_clouds do |t|
      t.string :formatVersion
      t.string :disclaimer
      t.string :offerCode
      t.string :version
      t.datetime :publicationDate

      t.timestamps
    end
  end
end
