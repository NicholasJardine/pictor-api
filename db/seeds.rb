User.destroy_all

puts "Seeding..."

nick = User.create(email: "nick@gmail.com", password: "123456")
roy = User.create( email: "roy@gmail.com", password: "123456")
alex = User.create( email: "alex@gmail.com", password: "123456")
hamza = User.create(  email: "hamza@gmail.com", password: "123456")
humbeline = User.create( email: "humbeline@gmail.com", password: "123456")
claire = User.create( email: "claire@gmail.com", password: "123456")
santi = User.create( email: "santi@gmail.com", password: "123456")


puts "#{User.all.count} users created"
