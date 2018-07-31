class TeamsController < ApplicationController
  def index
		@all_teams = current_user.teams
	end

	def new
		@team = Team.new
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
