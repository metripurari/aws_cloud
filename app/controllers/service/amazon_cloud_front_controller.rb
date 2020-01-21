class Service::AmazonCloudFrontController < ApplicationController

  def show
    query = {aws_amazon_cloud_products:{ location: params[:id]}}
    query = query.merge!(product_on_demands: {effectiveDate: params[:date]}) if params["date"]

    aws_cloud_products = PriceDimension.joins(:product_on_demand => :aws_amazon_cloud_product)
        .includes(:price_per_units, :product_on_demand => :aws_amazon_cloud_product)
        .where(query)
    render json: aws_cloud_products
  end
end
