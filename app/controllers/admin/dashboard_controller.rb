class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["USERNAME"], password: ENV["PASSWORD"]

  def show
    @productCount = Product.count(:all)
    @categoryCount = Category.count(:all)
  end
end
