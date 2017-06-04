require './lib/discount'

class UltLargeBulkDiscount < Discount
  DISCOUNTED_PRICE = 39.9

  def price
    ult_large_products.any? ? get_discount : 0
  end

  def remaining_products
    products - ult_large_products
  end

  private

  attr_reader :products

  def get_discount
    ult_large_products.count * ult_large_price
  end

  def ult_large_products
    products.select { |product| product.code === "ult_large" }
  end

  def ult_large_price
    ult_large_products.count > 3 ?
      DISCOUNTED_PRICE :
      ult_large_products.last.price
  end
end
