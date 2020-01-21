class PriceDimensionSerializer < ActiveModel::Serializer
  attributes :description, :beginRange, :endRange
  attributes :effectiveDate, :unit, :pricePerUnit

  def effectiveDate
    object.product_on_demand.effectiveDate
  end

  def unit
    object.price_per_units.first.unit
  end

  def pricePerUnit
    object.price_per_units.first.price
  end
end