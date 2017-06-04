require './lib/discount'

class UltMediumFreeOneGbDatapackDiscount < Discount
  def price
    ult_medium_products.any? ? get_discount : 0
  end

  def remaining_products
    products - ult_medium_products
  end

  def additional_products
    free_one_gb_datapacks
  end

  private

  def get_discount
    ult_medium_products.count * ult_medium_price
  end

  def free_one_gb_datapacks
    ult_medium_products.count.enum_for(:times).map do
      OneGbDatapackProduct.new(price: 0)
    end
  end

  def ult_medium_products
    products.select { |product| product.code === "ult_medium" }
  end

  def ult_medium_price
    ult_medium_products.last.price
  end
end
