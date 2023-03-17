class Admin::DashboardController < ApplicationController
  def show
    @productCount = Product.count(:all)
    @categoryCount = Category.count(:all)
  end
end
