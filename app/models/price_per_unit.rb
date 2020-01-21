class PricePerUnit < ApplicationRecord
  belongs_to :price_dimension, inverse_of: :price_per_units
end
