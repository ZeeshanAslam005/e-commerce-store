class Cart < ApplicationRecord
  belongs_to :product
  belongs_to :buyer
end
