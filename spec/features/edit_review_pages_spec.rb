require 'rails_helper'

describe "edit review" do
  it "edits a review" do
    product = Product.create(:name => 'Brie', :cost => '3.65', :origin => 'France')
    review = Review.create(:author => 'Sally', :content_body => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', :rating => '4', :product_id => product.id)
    visit edit_product_review_path(product, review)
    fill_in 'Author', :with => 'Jackie'
    click_on 'Update Review'
    expect(page).to have_content 'Jackie'
  end

  it "reutrns an error when author is left blank" do
    product = Product.create(:name => 'Brie', :cost => '3.65', :origin => 'France')
    review = Review.create(:author => 'Sally', :content_body => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', :rating => '4', :product_id => product.id)
    visit edit_product_review_path(product, review)
    fill_in 'Author', :with => ''
    click_button 'Update Review'
    expect(page).to have_content 'errors'
  end
end