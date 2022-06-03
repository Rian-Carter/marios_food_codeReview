require 'rails_helper'

describe "add a product" do
  it "adds a new product" do
    visit products_path
    click_link "New Product"
    fill_in 'Name', :with => "Brie Cheese"
    fill_in 'Cost', :with => "3.95"
    select 'France', :from => 'product_origin'
    click_on 'Create Product'
    expect(page).to have_content 'Products'
  end

  it "returns an error to the user if fields left blank" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content 'errors'
  end
end