# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

5.times do
  User.create!(
    username: Faker::Internet.user_name,
    email: Faker::Internet.safe_email,
    password: Faker::Internet.password(8),
)
end
users = User.all

me = User.new(
  email: 'napratt0826@yahoo.com',
  username: 'npratt11',
  password: 'password',
  password_confirmation: 'password',
)
me.skip_confirmation!
me.save!

5.times do
  Topic.create!(
    title: Faker::Pokemon.unique.name,
    user: users.sample
  )
end
topics = Topic.all

30.times do
  Bookmark.create!(
    user: users.sample,
    topic: topics.sample,
    url: Faker::Internet.unique.url
  )
end
bookmarks = Bookmark.all

puts "Seed finished"
puts "#{User.count} Users created"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} bookmarks created"
