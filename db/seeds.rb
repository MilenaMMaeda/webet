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
  email: "milena@gmail.com",
  password: "123456"
)

user1.wallet.update(balance: 200)
user1.save

# chip10 = Chip.create(name: "10", price_cents: 2_000)
# chip50 = Chip.create(name: "50", price_cents: 5_000)
# chip100 = Chip.create(name: "100", price_cents: 10_000)
# chip700 = Chip.create(name: "700", price_cents: 70_000)

chip1 = Chip.create(name: "20", price_cents: 2_000, image_url: "https://res.cloudinary.com/deo7maa3v/image/upload/v1678560912/ficha20_fqiqlm.png")
chip2 = Chip.create(name: "50", price_cents: 5_000, image_url: "https://res.cloudinary.com/deo7maa3v/image/upload/v1678560912/ficha50_h6vn1u.png")
chip3 = Chip.create(name: "100", price_cents: 10_000, image_url: "https://res.cloudinary.com/deo7maa3v/image/upload/v1678560412/ficha100_hyhjvu.png")
chip4 = Chip.create(name: "700", price_cents: 70_000, image_url: "https://res.cloudinary.com/deo7maa3v/image/upload/v1678561020/ficha700_fsbrva.png")

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
