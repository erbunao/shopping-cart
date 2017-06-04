class PromoCode
  CODES = {
    "I<3PROMO" => 0.10,
  }

  def self.apply(opts)
    new(opts).apply
  end

  def initialize(opts)
    @sum = opts[:sum]
    @promo_code = opts[:promo_code]
  end

  def apply
    sum * discount_rate
  end

  private

  attr_reader :sum, :promo_code

  def discount_rate
    return 1 unless CODES[promo_code]
    1.0 - CODES[promo_code]
  end
end
