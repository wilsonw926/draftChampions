class AddPlayersArraysToTeam < ActiveRecord::Migration[5.2]
  def change
  	add_column :teams, :players_array, :string, array:true
  	add_column :teams, :seen_players_array, :string, array:true
  end
end
