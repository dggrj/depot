class StoreController < ApplicationController
  skip_before_filter :authorize
  
  def index
    @products = Product.order(:title)
    session[:store_index_count] ||= 0
    count = session[:store_index_count] += 1
    if count > 5
      @count = count
    end
    @cart = current_cart
  end

end
