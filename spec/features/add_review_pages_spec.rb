require 'rails_helper'

describe "add a review process" do
  before(:each) do
    visit new_product_path
    click_link 'Sign-Up'
    fill_in 'user_email', with: 'useremail@gmail.com'
    fill_in 'user_password', with: 'testPassword1'
    fill_in 'user_password_confirmation', with: 'testPassword1'
    click_button 'Sign up'
  end

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