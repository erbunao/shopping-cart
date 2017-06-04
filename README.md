# Setup Instructions
```
  git clone git@github.com:erbunao/shopping-cart.git
  cd shopping-cart
  bin/setup
```
# Run all tests
```
  rake
```
# Run application in `irb`
Discount types are as follow: `UltSmallTwoForThreeDiscount`, `UltLargeBulkDiscount`, `UltMediumFreeOneGbDatapackDiscount`

```
  > Dir['./lib/*.rb'].each { |f| require_relative(f) }
  > # require everything inside lib folder
  > shopping_cart = ShoppingCart.new([UltSmallTwoForThreeDiscount, UltLargeBulkDiscount])
  > shopping_cart.add(product1)
  > shopping_cart.add(product2, promo_code)
  > shopping_cart.total
  > shopping_cart.items
```
