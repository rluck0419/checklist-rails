# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
names = ["Nebulae to visit", "Planets to visit", "Moons to visit", "Galaxies to visit"]

List.create!(name: names[0])
count = 1
10.times do
  Task.create!(list_id: 1, completed: false, body: Faker::Space.nebula, position: count)
  count += 1
end

List.create!(name: names[1])
count = 1
10.times do
  Task.create!(list_id: 2, completed: false, body: Faker::Space.planet, position: count)
  count += 1
end

List.create!(name: names[2])
count = 1
10.times do
  Task.create!(list_id: 3, completed: false, body: Faker::Space.moon, position: count)
  count += 1
end

List.create!(name: names[3])
count = 1
10.times do
  Task.create!(list_id: 4, completed: false, body: Faker::Space.galaxy, position: count)
  count += 1
end
