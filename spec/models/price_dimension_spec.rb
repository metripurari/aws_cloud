require 'rails_helper'

RSpec.describe PriceDimension, type: :model do
  it { should have_many(:price_per_units) }
  it { should belong_to(:product_on_demand) }
end