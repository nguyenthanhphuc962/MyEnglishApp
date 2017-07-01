class Exam < ApplicationRecord
	has_many :questions
	has_many :test_details
end
