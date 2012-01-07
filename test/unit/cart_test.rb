require 'test_helper'

class CartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "test adding unique products to cart" do
    cart = Cart.create
    pone = products(:prodone)
    ptwo = products(:prodtwo)
    cart.add_product(pone.id).save!
    cart.add_product(ptwo.id).save!
    
    assert cart.valid? "cart should have 2 unique products properly"
    assert_equal 2, cart.line_items.size, "should have 2 separate line items"
  end
  
  test "test adding multiple of one product to cart" do
    cart = Cart.create
    ruby = products(:ruby)
    cart.add_product(ruby.id).save!
    cart.add_product(ruby.id).save!
    assert cart.valid? "cart valid"
    assert_equal 1, cart.line_items.size, "should have 1 line item"
    assert_equal 2, cart.line_items[0].quantity
  end
  
  test "verify shopping cart total" do
    cart = Cart.create
    ruby = products(:ruby)
    cart.add_product(ruby.id).save

    cart.add_product(ruby.id).save
    assert_equal 99.0, cart.total_price
    
    cart.add_product(products(:prodone).id).save!
    assert_equal 108.99, cart.total_price
  end
  
end
