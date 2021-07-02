class Answer < ApplicationRecord
  validates :content, presence: true

  belongs_to :question
  belongs_to :user
end
