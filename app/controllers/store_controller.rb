class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
    session[:store_index_count] ||= 0
    count = session[:store_index_count] += 1
    if count > 5
      @count = count
    end
  end

end
