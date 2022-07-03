# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all
Review.destroy_all
User.destroy_all

admin= User.create!(:email => 'admin@test.com', :password => 'Testpassword123', :admin => true)
user = User.create!(:email => 'user@test.com', :password => 'Testpassword123')
3.times do |index|
  Product.create!(
    name: Faker::Food.unique.ingredient,
    cost: Faker::Number.decimal(l_digits: 2),
    origin: Faker::Address.country_by_code(code: 'US')
  )
end
  47.times do |index|
    product = Product.create!(
      name: Faker::Food.unique.ingredient,
      cost: Faker::Number.decimal(l_digits: 2),
      origin: Faker::Address.country
    )
    5.times do |index|
      Review.create!(
        author: Faker::FunnyName.name,
        content_body: Faker::Hipster.paragraph_by_chars(characters: 250, supplemental: false),
        rating: Faker::Number.between(from: 1, to: 5),
        product_id: product.id
      )
    end
  end
  p "Created #{Review.count} reviews"
end
p "Created #{Product.count} products"