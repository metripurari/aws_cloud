require 'rails_helper'

RSpec.describe ProductOnDemand, type: :model do
  it { should have_many(:price_dimensions) }
  it { should belong_to(:aws_amazon_cloud_product) }
end