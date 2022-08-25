# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"
User.destroy_all
Business.destroy_all
# Review.destroy_all
images = [
  "https://images2.minutemediacdn.com/image/upload/c_crop,h_1126,w_2000,x_0,y_181/f_auto,q_auto,w_1100/v1554932288/shape/mentalfloss/12531-istock-637790866.jpg",
  "https://wallpapercave.com/wp/wp3495545.jpg",
  "https://img.jakpost.net/c/2016/09/29/2016_09_29_12990_1475116504._large.jpg",
  "https://www.wallpapers4u.org/wp-content/uploads/cheeseburger_sandwich_fast_food_1446_1920x1080.jpg",
  "https://i.insider.com/5c5200a252414727b959e513?width=1100&format=jpeg&auto=webp",
  "https://www.wallpapers4u.org/wp-content/uploads/chinese_cuisine_noodles_meat_greens_hot_components_5792_1920x1080.jpg",
  "https://www.itl.cat/pngfile/big/212-2124047_chicken-food-wallpapers-full-hd-desktop-backgrounds-food.jpg",
  "https://images.pexels.com/photos/2983101/pexels-photo-2983101.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
  "https://www.teahub.io/photos/full/314-3149838_food-hd-wallpapers-1080p.jpg",
  "https://images7.alphacoders.com/368/368875.jpg",
]

10.times do |i|
  rating = rand(1..5)
  price = rand(1..5)
  phone = Faker::PhoneNumber.cell_phone
  businessName = Faker::Restaurant.name
  businessWeb = "www." + businessName.gsub(" ", "") + ".com"
  user1 = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email)
  user2 = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email)
  user3 = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email)

  business = Business.create(name: businessName, description: Faker::Restaurant.description,
                             address: Faker::Address.street_address,
                             state: Faker::Address.state,
                             zip: Faker::Address.zip,
                             contact: phone,
                             website: businessWeb,
                             image_url: images[i],
                             price: price)
  review1 = Review.new(content: Faker::Restaurant.review, rating: rating)
  review1.user = user1
  review1.business = business
  review1.save

  review2 = Review.new(content: Faker::Restaurant.review, rating: rating)
  review2.user = user2
  review2.business = business
  review2.save

  review3 = Review.new(content: Faker::Restaurant.review, rating: rating)
  review3.user = user3
  review3.business = business
  review3.save
end
