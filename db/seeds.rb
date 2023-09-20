require "faker"

User.destroy_all
puts "clearing database....."

50.times do
  User.create(
    fullname: Faker::FunnyName.three_word_name,
    username: Faker::Internet.username,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    trainer: [true, false].sample,
    gender: ['male', 'female'].sample
  )
end

puts "done creating users"

fitness_services = ["Personal Training", "Nutritionist", "Physio", "Pilates"]
trainers = User.where(trainer: true)
trainers.each do |trainer|
  10.times do
    Listing.create(
      category: fitness_services.sample,
      location: Faker::Address.street_address,
      details: Faker::TvShows::HowIMetYourMother.quote,
      user_id: trainer.id
    )
  end

  puts "done creating listings"
end
