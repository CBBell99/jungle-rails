require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
   # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
    @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
)
    end
  end
    
  scenario "They click the details button on the product to see details" do
      # ACT
      visit root_path
      first('article.product').find_link('Details »').click
    # # DEBUG / VERIFY
    
    expect(page).to have_content('Quantity')
    expect(page).to have_text('Description')
    save_screenshot
  end

end
