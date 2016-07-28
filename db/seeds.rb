require 'random_data'
require 'faker'

 # Create an admin user
 admin = User.create!(
   name:     'Admin01',
   email:    'admin01@example.com',
   password: 'helloworld',
   # role:     'admin'
 )
 
 # Create a member
 member = User.create!(
   name:     'Member User',
   email:    'member@example.com',
   password: 'helloworld'

5.times do
 User.create!(
  name:     Faker::Name.name,
  email:    Faker::Internet.free_email,
  password: RandomData.random_sentence
 )
end
users = User.all

30.times do
 Item.create!(
  name: Faker::Lorem.sentence(10),
  user: users.sample
 )
end
items = Item.all

 # Create an admin user
admin = User.create!(
 name:     'Admin',
 email:    'admin@gmail.com',
 password: 'helloworld',
 # role:     'admin'
)
 
# Create a member
member = User.create!(
 name:     'Member User',
 email:    'member@gmail.com',
 password: 'helloworld'
)
 
puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"