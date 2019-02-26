# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  released_at :datetime
#  avatar      :string
#  genre_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Movie < ApplicationRecord
  belongs_to :genre, counter_cache: true
  has_many :comments, dependent: :destroy

  def pair_guru_movie_details
    begin
      PairGuruMovieApi::Movie.cached_find(self.title).try(:first)
    rescue JsonApiClient::Errors::ApiError => e
      Rails.logger.error("PairGuruMovieApi::Movie.cached_find(#{self.title}) threw an error: #{e.message}")
      nil
    end
  end
end
