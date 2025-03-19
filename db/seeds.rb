require 'faker'
require 'csv'
require 'open-uri'
require 'json'

# Clear Existing Data
Category.destroy_all
Product.destroy_all
Order.destroy_all
User.destroy_all
Vendor.destroy_all
Tag.destroy_all

# Seed Categories
categories = ["Electronics", "Clothing", "Accessories", "Home & Kitchen", "Books", "Health & Beauty"]
categories.each { |name| Category.create!(name: name) }

# Seed Products from Fake Store API
puts "Fetching products from Fake Store API..."
response = URI.open("https://fakestoreapi.com/products").read
products = JSON.parse(response)

products.each do |product|
  Product.create!(
    name: product["title"],
    price: product["price"],
    description: product["description"],
    category: Category.find_by(name: "Electronics") || Category.first,  # Assign random category
    image_url: product["image"],  
    rating: product["rating"]["rate"],
    stock_quantity: rand(10..100),
    discount: [0, 5, 10, 15, 20].sample
  )
end

puts "Seeded Fake Store API products."

# Seed Products from CSV File
puts "Seeding products from CSV file..."
csv_text = File.read(Rails.root.join('db', 'products.csv'))
csv = CSV.parse(csv_text, headers: true)

csv.each do |row|
  Product.create!(
    name: row['name'],
    price: row['price'].to_f,
    description: row['description'],
    category: Category.find_or_create_by(name: row['category']),
    image_url: row['image_url'],
    rating: row['rating'].to_f,
    stock_quantity: row['stock_quantity'].to_i,
    discount: row['discount'].to_i
  )
end

puts "Seeded CSV products."

# Seed Users
puts "Seeding users..."
10.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email
  )
end

# Seed Vendors
puts "Seeding vendors..."
10.times do
  Vendor.create!(
    name: Faker::Company.name,
    contact_info: Faker::PhoneNumber.cell_phone
  )
end

# Associate Vendors with Products (Many-to-Many)
puts "Associating vendors with products..."
Product.all.each do |product|
  product.vendors << Vendor.order('RANDOM()').limit(rand(1..3))
end

# Seed Orders
puts "Seeding orders..."
50.times do
  order = Order.create!(
    user_name: Faker::Name.name,
    total_price: Faker::Commerce.price(range: 50.0..500.0)
  )
  # Associate orders with products
  order.products << Product.order('RANDOM()').limit(rand(1..5))
end

puts "Database seeding complete! 🚀"
