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

# premium = User.new(
#   username:   'Premium User',
#   email:      'premium@example.com',
#   password:   'helloworld'
#   role:       'premium'
# )
# premium.skip_confirmation!
# premium.save!
puts "Seed finished"
