class PriceDimension < ApplicationRecord
  has_many :price_per_units, dependent: :destroy, inverse_of: :price_dimension


  belongs_to :product_on_demand, inverse_of: :price_dimensions


  def build_price_per_unit(pricePerUnit)
    pricePerUnit.each do |key, value|
      price_per_unit = price_per_units.where(unit: key, price: value).first_or_initialize
      self.price_per_units << price_per_unit if price_per_unit.new_record?
    end
    self
  end
end
