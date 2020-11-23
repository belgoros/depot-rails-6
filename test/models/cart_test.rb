require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test '#add_product adds a unique product' do
    product = products(:ruby)
    cart = Cart.new
    line_item = cart.add_product(product)
    assert_equal 1, cart.line_items.size

    assert_equal line_item.price, product.price
  end

  test '#add_product adds a duplicate product' do
    cart = Cart.new
    cart.add_product(products(:ruby))
    cart.add_product(products(:ruby))

    assert_equal 2, cart.line_items.size
  end
end
