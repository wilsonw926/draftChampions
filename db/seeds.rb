# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#Users
User.create(email: 'admin@gmail.com', password: 'password', password_confirmation: 'password', admin: true)
User.create(email: 'user@gmail.com', password: 'password', password_confirmation: 'password', admin: false)

#Players

#QBs
p = Player.create(name: 'Michael Vick', position: 'QB', overall: 99)
p.front_card.attach(io: File.open('app/assets/images/michael_vick_f.png'), filename: 'michael_vick_f.png')
p.back_card.attach(io: File.open('app/assets/images/michael_vick_b.png'), filename: 'michael_vick_b.png')

p = Player.create(name: 'Aaron Rodgers', position: 'QB', overall: 97)
p.front_card.attach(io: File.open('app/assets/images/aaron_rodgers_f.png'), filename: 'aaron_rodgers_f.png')
p.back_card.attach(io: File.open('app/assets/images/aaron_rodgers_b.png'), filename: 'aaron_rodgers_b.png')

p = Player.create(name: 'Tom Brady', position: 'QB', overall: 96)
p.front_card.attach(io: File.open('app/assets/images/tom_brady_f.png'), filename: 'tom_brady_f.png')
p.back_card.attach(io: File.open('app/assets/images/tom_brady_b.png'), filename: 'tom_brady_b.png')