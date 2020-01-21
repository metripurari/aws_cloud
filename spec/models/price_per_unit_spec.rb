require 'rails_helper'

RSpec.describe PricePerUnit, type: :model do
  it { should belong_to(:price_dimension) }
end