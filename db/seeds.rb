require "faker"

Listing.destroy_all
User.destroy_all

puts "clearing database....."

User.create(
  fullname: "Test Trainer",
  username: "Trainer Test",
  address: "4 Lytton Street",
  email: "testuser@gmail.com",
  password: "123456",  # Make sure to use a string for the password
  trainer: true,
  gender: 'male'
)
# Retrieve the trainer you just created
trainer = User.find_by(email: "testuser@gmail.com")
# Create a listing for the trainer
Listing.create(
  category: "Personal Training",
  location: "4 Lytton Street, Cape Town",
  details: "Are you ready to take your fitness journey to the next level? Look no further! I'm Hugo, a dedicated personal trainer with a passion for helping individuals achieve their fitness goals through specialized weight training.",
  user_id: trainer.id )


address = ["4 S Arm Road, Cape Town","17 Rua Bartholomeu Dias Plain, Cape Town","13 Aandblom Street, Cape Town","15 Elsenham Avenue, Cape Town","52 Blue Valley Avenue, Cape Town",
  "69 Uys Krige Drive, Cape Town","50 Union Avenue, Cape Town","15 B. Molokoane Road, Cape Town","32 Denne Crescent, Cape Town",
  "130 Canal Road, Cape Town","41 Skilpadvlei Road, Cape Town","4 Lytton Street, Cape Town","8 Braambos Lane, Cape Town",
  "3 Lincoln Road, Cape Town","12 Democracy Way, Cape Town","10 Long Street, Cape Town", "Roeland Street, Cape Town"]

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
