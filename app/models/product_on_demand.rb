class ProductOnDemand < ApplicationRecord
  belongs_to :aws_amazon_cloud_product, inverse_of: :product_on_demands

  has_many :price_dimensions, dependent: :destroy, inverse_of: :product_on_demand

  attr_accessor :sku

  def build_price_dimension(price_dimension_array)
    price_dimension_array.collect do |price_dimension|
      pricePerUnit = price_dimension.delete("pricePerUnit")
      appliesTo = price_dimension.delete("appliesTo")
      price_dimension = price_dimensions.where(price_dimension).first_or_initialize
      price_dimension.build_price_per_unit(pricePerUnit)
    end
    self
  end
end
