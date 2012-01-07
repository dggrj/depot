class AdminController < ApplicationController
  def index
    @total_orders = Order.count
    @shipped_orders = Order.where(!:ship_date.nil?).count
  end

end
