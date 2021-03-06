# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless User.exists?(email: 'admin@bunnyhotel.com')
  User.create!(email: 'admin@bunnyhotel.com', password: 'password', admin: true)
end

user = User.find_by(email: 'admin@bunnyhotel.com')

customer = Customer.create(
  {
    first_name: 'Jon',
    last_name: 'Eccles',
    phone: '07791 513121',
    email: 'getjon@me.com',
    notes:
    %(Jon likes to leave his rabbits here for a long time and has failed to pay on a couple of occaisions resulting in a lot of chasing!).squish,
    vet_details:
    %(Gayton Surgery, Hatchlands Road, Reigate).squish,
    author: user
  }
)
customer.bookings.create(
  [{
    drop_off: '01/08/2021',
    pick_up: '26/08/2021',
    notes: 'Dropping off in the morning, picking up mid-afternoon',
    author: user
  },
   {
     drop_off: '21/10/2021',
     pick_up: '30/10/2021',
     notes: '',
     author: user
   }, {
     drop_off: '19/12/2021',
     pick_up: '03/01/2022',
     notes: 'Will drop off Xmas presents for the pets',
     author: user
   }, {
     drop_off: '10/02/2022',
     pick_up: '26/02/2022',
     notes: '',
     author: user
   }]
)
customer.pets.create(
  [{
    name: 'Thumper',
    animal: 'House Rabbit',
    vaccinated: true,
    status: 'Active',
    notes: 'Feisty - watch yourself when handling!',
    author: user
  },
   {
     name: 'Humphrey',
     animal: 'Guinea Pig',
     vaccinated: false,
     status: 'Active',
     notes: "Doesn't say much",
     author: user
   }]
)
customer.save
