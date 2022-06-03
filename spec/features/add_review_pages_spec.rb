require 'rails_helper'

describe "add a review process" do
  it "adds a review" do
    product = Product.create(:name => 'Brie', :cost => '3.95', :origin => 'France')
    visit product_path(product)
    click_link 'Write a Review'
    fill_in 'Author', :with => "Sally"
    fill_in 'Content body', :with => "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    fill_in 'Rating', :with => 3
    click_on 'Create Review'
    expect(page).to have_content 'Brie'
  end

  it "returns an error if form left blank" do
    product = Product.create(:name => 'Brie', :cost => '3.95', :origin => 'France')
    visit new_product_review_path(product)
    click_on 'Create Review'
    expect(page).to have_content 'errors'
  end
end