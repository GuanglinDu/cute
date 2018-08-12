# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the
# db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Creates admins
Admin.delete_all
Admin.create! email: "tom.cat@example.com",
              role: 5,
              password: "password",
              password_confirmation: "password"

Admin.create! email: "jerry.mouse@example.com",
              role: 4,
              password: "password",
              password_confirmation: "password"

# Creates some contacts
Contact.delete_all
Contact.create!(name: "David Heinemeier Hansson",
                mobile: "139123456789",
                role: 1,
                priority: 1,
                address: "Santa county",
                email: "exampe@example.com",
                note: "Rails creator")

99.times do |n|
  name     = Faker::Name.name
  mobile   = Faker::PhoneNumber.cell_phone
  phone    = Faker::PhoneNumber.phone_number
  role     = Faker::Number.between(0, 4)
  priority = Faker::Number.between(0, 5)  
  address  = Faker::Address.street_address
  email    = Faker::Internet.email
  note     = Faker::Lorem.sentence
  Contact.create!(name:     name,
                  mobile:   mobile,
                  phone:    phone,
                  role:     role,
                  priority: priority,
                  address:  address,
                  email:    email,
                  note:     note)
end
