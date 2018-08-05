class TeamsController < ApplicationController
  def index
  	my_teams = Team.where(user_id: current_user.id)
		if my_teams.blank?
			new()
		end
		@all_teams = current_user.teams
		@all_teams.each do |team|
			if team.started == true and team.drafted == false
				team.destroy
			end
		end
	end

	def show
		@team = Team.find(params[:id])
		@all_players = []
		0.upto(@team.players_array.length-1) do |n|
			@all_players.push(Player.find_by(id: @team.players_array[n]))
		end
		@all_players = @all_players.sort_by{ |a| a[:overall] }.reverse!
	end

	def create
		new()
		redirect_to teams_path
	end

	def new
		t = Team.new(name: 'New Team ' + (Time.now).to_s, user_id: current_user.id)
		t.players_array = []
		t.seen_players_array = []
		gold_players = Player.where("overall < 85")
		for gp in gold_players
			t.players_array.push(gp.id)
			t.seen_players_array.push(gp.id)
		end
		t.save
	end

	def add_player
		@team = Team.find(params[:id])
		@team.players_array.push(params[:selected_player].to_i)
		@team.overall_sum += params[:player_overall].to_i
		if params[:round_number].to_i == 15
			@team.drafted = true
			@team.save
			redirect_to teams_path
		else
			@team.save
			redirect_to draft_path
		end
	end

	def draft
		positions = ['T', 'G', 'C', 'G', 'T', 'TE', 'WR', 'WR', 'FB', 'QB', 'HB', 'WR', 'S', 'LB', 'MLB', 'MLB', 'LB', 'S', 'CB', 'DE', 'DT', 'DT', 'DE', 'CB']
		@team = Team.find(params[:id])
		@team.started = true
		@round = params[:round_number].to_i + 1
		@player_one, @player_two, @player_three = render_three_players(positions)
		@three_players = [@player_one, @player_two, @player_three]
		for p in @three_players
			@team.seen_players_array.push(p.id)
		end
		if @team.seen_players_array.length > 24 + 3 * @round
			@team.destroy
			redirect_to teams_path
		end
		@my_players = []
		0.upto(@team.players_array.length-1) do |n|
			@my_players.push(Player.find_by(id: @team.players_array[n]))
		end
		@my_players = @my_players.sort_by{ |a| a[:overall] }.reverse!
		@team.save
	end

	def render_three_players(positions)
		seen = @team.seen_players_array
		player_one_arr = Player.where("position = ? AND overall > ?", positions[rand(positions.length)], 85)
		player_one = player_one_arr[rand(player_one_arr.length)]
		player_two_arr = Player.where("position = ? AND overall > ?", positions[rand(positions.length)], 85)
		player_two = player_two_arr[rand(player_two_arr.length)]
		player_three_arr = Player.where("position = ? AND overall > ?", positions[rand(positions.length)], 85)
		player_three = player_three_arr[rand(player_three_arr.length)]
		#ensures no duplicates
		if player_one == player_two or player_one == player_three or player_two == player_three or seen.include?(player_one.id) or seen.include?(player_two.id) or seen.include?(player_three.id)
			player_one, player_two, player_three = render_three_players(positions)
		end
		return player_one, player_two, player_three
	end

	def destroy
		@team = Team.find(params[:id])
		@team.delete
		redirect_to teams_path
	end

end
