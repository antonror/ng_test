class Comment < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates :user_id, :movie_id, :content, presence: true
  validates :movie_id, uniqueness: { scope: :user_id }
end
