class TeamsController < ApplicationController
  def index
  	my_teams = Team.where(user_id: current_user.id)
		if my_teams.blank?
			new()
		end
		@all_teams = current_user.teams
	end

	def new
		t = Team.new(name: 'New Team ' + (Time.now).to_s, user_id: current_user.id)
		t.players_array = []
		gold_players = Player.where("overall < 85")
		for gp in gold_players
			t.players_array.push(gp.id)
		end
		t.save
	end

	def draft
		positions = ['T', 'G', 'C', 'G', 'T', 'TE', 'WR', 'WR', 'FB', 'QB', 'HB', 'WR', 'S', 'LB', 'MLB', 'MLB', 'LB', 'S', 'CB', 'DE', 'DT', 'DT', 'DE', 'CB']
		@team = Team.find(params[:id])
		@round = params[:round_number]
		@player_one, @player_two, @player_three = render_three_players(positions)
	end

	def render_three_players(positions)
		seen = @team.players_array
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

	def delete
		@team = Team.find(params[:id])
		@team.delete
		redirect_to root_path
	end

	def show
		@team = Team.find(params[:id])
	end
end
