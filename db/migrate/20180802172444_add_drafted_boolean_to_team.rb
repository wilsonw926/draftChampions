class AddDraftedBooleanToTeam < ActiveRecord::Migration[5.2]
  def change
  	add_column :teams, :drafted, :boolean, default: false
  end
end
