require 'rails_helper'

describe "add a product" do
  before(:each) do
    visit new_product_path
    click_link 'Sign-Up'
    fill_in 'user_email', with: 'useremail@gmail.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'
    @user = User.last
    @user.update(admin: true)
    visit new_product_path
  end

  it "adds a new product" do
    fill_in 'Name', :with => "Brie Cheese"
    fill_in 'Cost', :with => "3.95"
    select 'France', :from => 'product_origin'
    click_on 'Create Product'
    expect(page).to have_content 'Products'
  end

  it "returns an error to the user if fields are left blank" do
    click_on 'Create Product'
    expect(page).to have_content 'errors'
  end
end