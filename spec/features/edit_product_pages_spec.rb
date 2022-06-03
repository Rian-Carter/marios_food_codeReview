require 'rails_helper'

describe "edit product process" do
  it "edits a product" do
    product = Product.create(:name => 'Brie', :cost => '3.95', :origin => "France")
    visit edit_product_path(product)
    fill_in 'Name', :with => 'French Fries'
    click_on 'Update Product'
    expect(page).to have_content 'French Fries'
  end

  it "returns an error if description is left blank" do
    product = Product.create(:name => 'Brie', :cost => '3.95', :origin => 'France')
    visit edit_product_path(product)
    fill_in 'Name', :with => ''
    click_button 'Update Product'
    expect(page).to have_content 'errors'
  end

  it "delete a product" do
    product = Product.create(:name => 'Brie', :cost => '3.95', :origin => 'France')
    visit product_path(product)
    click_button 'Delete Product'
    expect(page).not_to have_content 'Cheese'
  end
end