class CopyPriceToLineItem < ActiveRecord::Migration
  def up
	  LineItem.all.each do |li|
      li.update_attributes(:price => (Product.find(li.product_id).price * li.quantity).to_f )
	  end
  end

  def down
	  LineItem.all.each do |li|
      li.update_attributes(:price => nil)
	  end
  end
end
