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

	def create 
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
