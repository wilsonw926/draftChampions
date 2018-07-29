class AddAssociationsPlayerTeamUser < ActiveRecord::Migration[5.2]
  def change
  	add_reference :teams, :user, index: true
  	add_reference :players, :team, index: true
  end
end
