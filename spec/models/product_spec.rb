require 'rails_helper'

describe Product do
  it {should validate_presence_of :name}
  it {should validate_presence_of :cost}
  it {should validate_presence_of :origin}
  
  it {should have_many(:reviews)}
end

describe Product do
  it("titleizes the name of a product") do
    product = Product.create({name: "brie", cost: "1.25", origin: "united states of america"})
    expect(product.name()).to(eq("Brie"))
  end
end