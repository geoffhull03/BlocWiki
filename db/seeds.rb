# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


10.times do
    User.create!(
        email: Faker::Internet.email,
        password: Faker::Internet.password(6),
        role: Faker::Number.between(0,1),
        confirmed_at: Time.now
    )
end

20.times do
    Wiki.create!(
        title: Faker::GameOfThrones.character,
        body: Faker::Hipster.paragraph
    )
end


puts "Seed finished"
puts "#{Wiki.count} wikis created"
puts "#{User.count} users created"
