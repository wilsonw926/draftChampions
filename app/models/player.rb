class Player < ApplicationRecord
	has_one_attached :front_card
	has_one_attached :back_card
	belongs_to :team
end
