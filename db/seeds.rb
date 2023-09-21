require "faker"

Listing.destroy_all
User.destroy_all

puts "clearing database....."

User.create(
  fullname: "Test Trainer",
  username: "Trainer Test",
  address: "4 Lytton Street",
  email: "testuser@gmail.com",
  password: 123456,
  trainer: true,
  gender: ['male', 'female'].sample
)

User.create(
  fullname: "Test User",
  username: "User Test",
  address: "4 Lytton Street",
  email: "testuser@gmail.com",
  password: 123456,
  trainer: false,
  gender: ['male', 'female'].sample
)

address = ["13 Aandblom Street","15 Elsenham Avenue","52 Blue Valley Avenue",
  "69 Uys Krige Drive","50 Union Avenue","15 B. Molokoane Road","32 Denne Crescent",
  "130 Canal Road","41 Skilpadvlei Road","4 Lytton Street","8 Braambos Lane",
  "3 Lincoln Road","12 Democracy Way",]

  fitness_services = ["Personal Training", "Nutritionist", "Physio", "Pilates"]

10.times do
  User.create(
    fullname: Faker::FunnyName.three_word_name,
    username: Faker::Internet.username,
    address: address.sample,
    email: Faker::Internet.email,
    password: 123456,
    trainer: [true, false].sample,
    gender: ['male', 'female'].sample
  )
end

puts "done creating users"

trainers = User.where(trainer: true)
trainers.each do |trainer|
    2.times do
      Listing.create(
        category: fitness_services.sample,
        location: address.sample,
        details: Faker::TvShows::HowIMetYourMother.quote,
        user_id: trainer.id
      )
    end

  puts "done creating listings"
end
