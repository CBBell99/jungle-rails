require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do
   
    it 'should save a product when all fields are entered' do
      @category = Category.new(name: 'Vehicles')
      @product = Product.new(name: 'Hoverboard', price: 500, quantity: 500, category: @category)
      expect(@product).to be_valid
    end   
    
    it 'should fail if a name is not entered' do 
      @category = Category.new(name: 'Vehicles')
      @product = Product.new(name: nil, price: 500 , quantity: 500, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    
     it 'should fail if a price is not entered' do 
      @category = Category.new(name: 'Vehicles')
      @product = Product.new(name: "Hova", price_cents:nil , quantity: 500, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    
    it 'should fail if a quantity is not entered' do 
      @category = Category.new(name: 'Vehicles')
      @product = Product.new(name: 'Hoverboard' , price: 500 , quantity: nil, category: @category)
      expect(@product.valid?).to be false
            expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it 'should fail if a category is not entered' do 
      @category = Category.new(name: 'Vehicles')
      @product = Product.new(name: 'Hoverboard' , price: 500 , quantity: 500, category: nil)
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end



    
    
  end
end