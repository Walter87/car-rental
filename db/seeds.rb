# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(email: 'mail@example.com', password: 'pass1234',)
puts "Seeds start"
10.times do
  Customer.create(
    name: Faker::Name.first_name,
    surname: Faker::Name.last_name,
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    zip_code: Faker::Address.zip_code,
    notes: Faker::Lorem.sentence,
    )
end

cars = ['Suzuki Ignis red C','Mercedes E-classe black A','Opel AstraIII silver B']
cars.each do |car|
car = car.split
Car.create!(
  make:           car[0],
  model:          car[1],
  description:    car[2],
  comfort_class:  car[3],
    )
end
RentalOrder.create(
  customer_id: rand(1..10),
  user_id:  1,
  car_id:   1,
  start_date: Faker::Time.forward(10, :morning),
  end_date: Faker::Time.forward(17, :morning),
  )
RentalOrder.create(
  customer_id: rand(1..10),
  user_id:  1,
  car_id:   2,
  start_date: Faker::Time.forward(1, :morning),
  end_date: Faker::Time.forward(5, :morning),
  )
RentalOrder.create(
  customer_id: rand(1..10),
  user_id:  1,
  car_id:   3,
  start_date: Faker::Time.forward(20, :morning),
  end_date: Faker::Time.forward(26, :morning),
  )

puts "Seeds stop,"




