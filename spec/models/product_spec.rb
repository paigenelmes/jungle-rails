require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "can be saved if all 4 attributes are valid" do
      #Variable the trees category
      @category3 = Category.create(name: 'Trees')
      #Creating a new product to validate
      @product = Product.create(name: 'Maple',
                                price_cents: 200000,
                                quantity: 5,
                                category: @category3)
      #Expectations for each attribute
      expect(@product.name).to eq('Maple')
      expect(@product.price_cents).to eq(200000)
      expect(@product.quantity).to eq(5)
      expect(@product.category).to eq(@category3)
    end

    it "displays an error if the name is missing" do
      #Variable for the Evergreens category
      @category1 = Category.create(name: 'Evergreens')
      #Creating a new product without a name
      @product = Product.create(name: nil,
                                price_cents: 500000,
                                quantity: 10,
                                category: @category1)
      #Expect an error message
      expect(@product.errors.full_messages).to be_present
    end

    it "displays an error if the price is missing" do
      #Variable for the Shrubs category
      @category2 = Category.create(name: 'Shrubs')
      #Creating a new product without a price
      @product = Product.create(name: 'Cypress',
                                price_cents: nil,
                                quantity: 3,
                                category: @category2)
      #Expect an error message
      expect(@product.errors.full_messages).to be_present
    end

    it "displays an error if the quantity is missing" do
      #Variable for the Flowers category
      @category4 = Category.create(name: 'Flowers')
      #Creating a new product without a quantity
      @product = Product.create(name: 'Hibiscus',
                                price_cents: 2000,
                                quantity: nil,
                                category: @category4)
      #Expect an error message
      expect(@product.errors.full_messages).to be_present
    end

    it "displays an error if the category is missing" do
      #Creating a new product without a category
      @product = Product.create(name: 'Pine',
                                price_cents: 400000,
                                quantity: 3,
                                category: nil)
      #Expect an error message
      expect(@product.errors.full_messages).to be_present
    end
  end
end
