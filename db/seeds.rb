puts "cleaning up database"

Restaurant.destroy_all

puts "database is clean"

puts "creating restaurants.."

50.times do
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    chef_name: Faker::Games::Fallout.character,
    stars: rand(1..5)
  )
  puts "restaurant #{restaurant.id} is created"
end

puts "finished! 😀"
