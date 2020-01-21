require 'rest-client'

class AwsAmazonCloud < ApplicationRecord
  has_many :aws_amazon_cloud_products, dependent: :destroy, inverse_of: :aws_amazon_cloud

  attr_accessor :products, :terms

  before_create :save_aws_amazon_cloud_products

  AWS_URL = 'https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonCloudFront/current/index.json'

  def build_only_price(terms)
    PricePerUnit.build_new_prices(terms)
  end

  def self.create_or_build
    response = RestClient.get AwsAmazonCloud::AWS_URL
    response = JSON.parse(response)
    aws_server = where(formatVersion: response["formatVersion"]).first_or_initialize
    if aws_server.new_record?
      aws_server = new(response)
    else
      aws_server.products = response["products"]
      aws_server.terms = response["terms"]
      aws_server.save_aws_amazon_cloud_products
    end
    aws_server.save
  end

  def save_aws_amazon_cloud_products
    products.each do |_, value|
      attributes = value.delete("attributes")
      value.merge!(attributes)
      aws_amazon_cloud_product = aws_amazon_cloud_products.where(value).first_or_initialize
      aws_amazon_cloud_product.build_product_on_demand(terms)
    end
  end
end
