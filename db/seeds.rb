# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Bet.destroy_all

Bet.create(
  description: "vai chover até as 15h",
  amount: 10,
  start_date: DateTime.yesterday,
  end_date: DateTime.tomorrow,
  status: "open"
)

Bet.create(
  description: "Victor vai beber até as 18:30",
  amount: 10,
  start_date: DateTime.yesterday,
  end_date: DateTime.tomorrow,
  status: "open"
)

Bet.create(
  description: "Bruno vai pegar o buquê",
  amount: 10,
  start_date: DateTime.yesterday,
  end_date: DateTime.tomorrow,
  status: "open"
)
