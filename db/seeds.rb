# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do User.create!(
    name: Faker::Name.first_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

me = User.create!(
  name: "anthony",
  email: "user@example.com",
  password: "password",
  confirmed_at: Time.now
)

users = User.all

50.times do
  Item.create!(
    name: Faker::Hipster.sentence(5),
    user: users.sample
  )
end

puts "Seeds Finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
