class Test < ApplicationRecord
  belongs_to :user
  has_many :test_details
end
