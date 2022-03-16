require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  before :each do
    @user = User.create!(first_name: "Goku", last_name: "Son", email:"itsover9000@example.com", password: "password", password_confirmation: "password")
  end

  scenario "Should log in a user" do
    visit '/login'
    puts page.html
    fill_in 'email', with: 'itsover9000@example.com'
    fill_in 'password', with: 'password'
    click_on 'Submit'
    expect(page).to have_content('Products')
    save_screenshot
  end
end
