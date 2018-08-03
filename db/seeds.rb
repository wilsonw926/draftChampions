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
def create_players(name, position, overall)
	p = Player.create(name: name, position: position, overall: overall)
	playerFileName = name.delete(' ')
	front = 'app/assets/images/' + playerFileName + 'F.png'
	back = 'app/assets/images/' + playerFileName + 'B.png'
	p.front_card.attach(io: File.open(front), filename: '#{playerFileName}F.png')
	p.back_card.attach(io: File.open(back), filename: '#{playerFileName}B.png')
end

#Golds

#OFFENSE
offense_player_names = ['Nate Solder', 'Jah Reid', 'Eric Wood', 'Brandon Fusco', 'Michael Schofield', 'Virgil Green', 'Tavon Austin', 'John Brown', 'Mike Tolbert', 'Alex Smith', 'David Johnson', 'Allen Robinson']
offense_player_positions = ['T', 'G', 'C', 'G', 'T', 'TE', 'WR', 'WR', 'FB', 'QB', 'HB', 'WR']
offense_player_overalls = [79, 74, 78, 78, 75, 77, 75, 78, 74, 79, 78, 77]
0.upto(offense_player_names.length-1) do |n|
	create_players(offense_player_names[n], offense_player_positions[n], offense_player_overalls[n])
end

#DEFENSE
defense_player_names = ['Eric Reid', 'Alec Ogletree', 'Brian Cushing', 'Danny Trevathan', 'Akeem Ayers', 'Kenny Vaccaro', 'Janoris Jenkins', 'Stephen Paea', 'Al Woods', 'Chris Baker', 'Frostee Rucker', 'Brandon Boykin']
defense_player_positions = ['S', 'LB', 'MLB', 'MLB', 'LB', 'S', 'CB', 'DE', 'DT', 'DT', 'DE', 'CB']
defense_player_overalls = [78, 78, 79, 75, 77, 74, 78, 78, 74, 75, 77, 79]
0.upto(defense_player_names.length-1) do |n|
	create_players(defense_player_names[n], defense_player_positions[n], defense_player_overalls[n])
end

#Elite

#QBs
qb_player_names = ['Michael Vick', 'Peyton Manning', 'Aaron Rodgers', 'Cam Newton', 'Tom Brady']
qb_overalls = [99, 99, 97, 97, 96]
0.upto(qb_player_names.length-1) do |n|
	create_players(qb_player_names[n], 'QB', qb_overalls[n])
end

#RB
hb_player_names = ['Bo Jackson', 'Chris Johnson', 'Devonta Freeman', 'Lesean Mccoy', 'Leveon Bell']
hb_overalls = [99, 99, 97, 96, 95]
0.upto(hb_player_names.length-1) do |n|
	create_players(hb_player_names[n], 'HB', hb_overalls[n])
end

#FB
fb_player_names = ['Christian Okoye', 'Patrick Dimarco', 'Anthony Sherman']
fb_overalls = [99, 98, 97, 96, 95]
0.upto(fb_player_names.length-1) do |n|
	create_players(fb_player_names[n], 'FB', fb_overalls[n])
end
