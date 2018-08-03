class AddDraftedBooleanToTeam < ActiveRecord::Migration[5.2]
  def change
  	add_column :teams, :drafted, :boolean, default: false
  	add_column :teams, :players_array, :string, array:true
  end
end
