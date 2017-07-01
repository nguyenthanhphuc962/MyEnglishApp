class Question < ApplicationRecord
	has_many :choices
	belongs_to :exam

	def feed
		Choice.where("is_correct = ? ", 1)
	end
end
