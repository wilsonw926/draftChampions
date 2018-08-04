class PlayersController < ApplicationController
  def index
		@all_players = Player.all
	end

	def new
		@player = Player.new
	end

	def destroy
		@player = Player.find(params[:id])
		@player.delete
		redirect_to root_path
	end

	def create
    @player = Player.new(player_params)
    if @player.save!
      flash['success'] = 'Player has been created succesfully.'
      redirect_to root_path
    else
      flash[:error] = @player.errors.full_messages.to_sentence
      redirect_to new_player_path
    end
	end

	def edit
  	@player = Player.find(params[:id])
	end

	def update
    @player = Player.find(params[:id])
    @player.update(player_params)
    redirect_to root_path
  end

	def show
		@player = Player.find(params[:id])
	end

  private

  def player_params
  	params.require(:player).permit(:name, :position, :overall, :front_card, :back_card)
  end
end
