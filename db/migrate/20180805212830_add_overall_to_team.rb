class AddOverallToTeam < ActiveRecord::Migration[5.2]
  def change
  	add_column :teams, :overall_sum, :integer, default: 1844
  end
end
