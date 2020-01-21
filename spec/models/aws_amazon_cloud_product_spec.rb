require 'rails_helper'

RSpec.describe AwsAmazonCloudProduct, type: :model do
  it { should have_many(:product_on_demands) }
  it { should belong_to(:aws_amazon_cloud) }
end
