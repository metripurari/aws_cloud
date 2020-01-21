class AwsAmazonCloudProduct < ApplicationRecord
  belongs_to :aws_amazon_cloud, inverse_of: :aws_amazon_cloud_products

  has_many :product_on_demands, dependent: :destroy, inverse_of: :aws_amazon_cloud_product

  def build_product_on_demand(terms)
    terms["OnDemand"][sku].each do |_, value|
      price_dimension = value.delete("priceDimensions")
      value.delete("termAttributes")
      value.delete("sku")
      product_on_demand = product_on_demands.where(value).first_or_initialize
      product_on_demand.build_price_dimension(price_dimension.values)
    end
    self
  end
end
