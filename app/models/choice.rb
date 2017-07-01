class Choice < ApplicationRecord
  belongs_to :question
  validates :question_id, presence: true
  validates :content, length: { maximum: 140 }
  validates :is_correct, presence: true
end
