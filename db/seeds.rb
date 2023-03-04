# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Bet.destroy_all
User.destroy_all

user1 = User.create(
  email: "umilena@gmail.com",
  password: "123456"
)

Bet.create!(
  user: user1,
  description: "vai chover até as 15h",
  amount: 10,
  start_date: DateTime.yesterday,
  end_date: DateTime.tomorrow,
  status: "open",
  max_users: 5
)

Bet.create!(
  user: user1,
  description: "Victor vai beber até as 18:30",
  amount: 10,
  start_date: DateTime.yesterday,
  end_date: DateTime.tomorrow,
  status: "open",
  max_users: 5
)

Bet.create!(
  user: user1,
  description: "Bruno vai pegar o buquê",
  amount: 10,
  start_date: DateTime.yesterday,
  end_date: DateTime.tomorrow,
  status: "open",
  max_users: 5
)

puts "Seed completed"
