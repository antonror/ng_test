require "rails_helper"

describe Movie do
  let!(:movie) { create(:movie) }
  it 'has stubbed movie details' do
    expect(movie.pair_guru_movie_details).to be_present
    expect(movie.pair_guru_movie_details).to be_instance_of(PairGuruMovieApi::Movie)
    expect(movie.pair_guru_movie_details.poster_url).to be_present
    expect(movie.pair_guru_movie_details.poster_url).to include('/godfather.jpg')
  end
end
