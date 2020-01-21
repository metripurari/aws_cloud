require 'rails_helper'

RSpec.describe AwsAmazonCloud, type: :model do
  it { should have_many(:aws_amazon_cloud_products) }

  it "creates a new record" do
    AwsAmazonCloud.create_or_build
    expect(AwsAmazonCloud.count).to eq(1)
    expect(AwsAmazonCloudProduct.count).to eq(1)
    expect(PriceDimension.count).to eq(1)
    expect(PricePerUnit.count).to eq(1)
    expect(ProductOnDemand.count).to eq(1)
    AwsAmazonCloud.create_or_build
    expect(AwsAmazonCloud.count).to eq(1)
    expect(AwsAmazonCloud.count).to eq(1)
    expect(AwsAmazonCloudProduct.count).to eq(1)
    expect(PriceDimension.count).to eq(1)
    expect(PricePerUnit.count).to eq(1)
    expect(ProductOnDemand.count).to eq(1)
  end
end

