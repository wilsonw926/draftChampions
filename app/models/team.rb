class Team < ApplicationRecord
	has_many :players
	belongs_to :user
	serialize :players_array, Array
	serialize :seen_players_array, Array
end
