require 'faker'

admin = User.new(
  username:       'Admin User',
  email:      'admin@example.com',
  password:   'helloworld',
  role:       'admin'
)
admin.skip_confirmation!
admin.save!

standard = User.new(
  username:   'Standard User',
  email:      'standard@example.com',
  password:   'helloworld',
)
standard.skip_confirmation!
standard.save!

premium = User.new(
  username:   'Premium User',
  email:      'premium@example.com',
  password:   'helloworld',
  role:       'premium'
)
premium.skip_confirmation!
premium.save!

10.times do
  user = User.new(
  username: Faker::Name.name,
  email: Faker::Internet.email,
  password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end

users = User.all

100.times do
  user = users.sample 
  Wiki.create!(
    user: user,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    private: user.premium? ? [true, false][rand(1)] : false
  )
end

puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
puts "Seed finished"
