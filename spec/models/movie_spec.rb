
describe Movie do
  let!(:movie) { create(:movie) }
  it 'has stubbed movie details' do
    expect(movie.pair_guru_movie_details).to be_present
    expect(movie.pair_guru_movie_details).to be_instance_of(PairGuruMovieApi::Movie)
    expect(movie.pair_guru_movie_details.poster_url).to be_present
    expect(movie.pair_guru_movie_details.poster_url).to include('/godfather.jpg')
  end

  it 'handles json_api_client errors for pair_guru_movie_details' do
    stub_request(:get, /api.example.org/).
        to_return(status: 500,
                  headers: {'Content-Type'=>'application/vnd.api+json'},
                  body: '')
    expect(movie.pair_guru_movie_details).to_not be_present
  end

  it 'raises exception for undefined hostname' do
    expect(PairGuruMovieApi).to receive(:hostname).and_call_original
    expect(PairGuruMovieApi.hostname).to eq(ENV['PAIR_GURU_MOVIE_API_HOSTNAME'])
  end

  it { is_expected.to have_many(:comments) }
end
