require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "should be valid with valid attributes" do
      @category = Category.new(name: 'Apparel')
      @product = Product.new(name: "prodName", price: 500, quantity: 4, category: @category)
      expect(@product).to be_valid
    end

    it "should have a name" do
     @category = Category.new(name: 'Apparel')
     @product = Product.new(name: nil, price: 500, quantity: 4, category: @category)
     expect(@product).to_not be_valid
   end
    it "should have a price" do
      @category = Category.new(name: 'Apparel')
     @product = Product.new(name: "prodName", price: nil, quantity: 4, category: @category)
     expect(@product).to_not be_valid
   end
    it "should have a quantity" do
    @category = Category.new(name: 'Apparel')
     @product = Product.new(name: "prodName", price: 500, quantity: nil, category: @category)
     expect(@product).to_not be_valid
   end
    it "should have a category" do
    @category = Category.new(name: 'Apparel')
    @product = Product.new(name: "prodName", price: 500, quantity: 4, category: nil)
    expect(@product).to_not be_valid
  end
end
end


