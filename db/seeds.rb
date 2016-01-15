require 'ffaker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# admin account
User.create(email: "admin@admin.com", firstname: "Jan", lastname: "Kowalski", password: "password", password_confirmation: "password", admin: true)


# users accounts
5.times do |i|
  email = "user#{i}@user.com"
  firstname = Faker::Name.first_name
  lastname = Faker::Name.last_name

  User.create(email: email, firstname: firstname, lastname: lastname, password: "password", password_confirmation: "password")
end

# categories
8.times do |i|
  name = "Category name #{i}"
  Category.create(name: name)
end

Category.all.each do |c|
  category_id = c.id
  30.times do |i|
    title = "Product #{i}"
    desc_length = (1..20).to_a.sample
    description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc interdum nisl a laoreet condimentum." * desc_length
    price = (1..2000).to_a.sample
    user_id = User.all.to_a.sample.id
    Product.create(title: title, description: description, price: price, category_id: category_id, user_id: user_id)
  end
end

Product.all.each do |product|
  (3..7).to_a.sample.times do |i|
    content_length = (1..4).to_a.sample
    content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit." * content_length
    rating = (1..5).to_a.sample
    product_id = product.id
    user_id = User.all.to_a.sample.id
    Review.create(content: content, rating: rating, product_id: product_id, user_id: user_id)
  end
end

