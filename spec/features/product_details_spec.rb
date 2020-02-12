require 'rails_helper'

RSpec.feature "Visitor navigates from the home page to the product detail page", type: :feature, js: true do
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

  scenario "They see the product they clicked on" do

    visit root_path

    find('.pull-right', match: :prefer_exact).click
    
    expect(page).to have_css('.product-detail')

    save_screenshot

  end
end