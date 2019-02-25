

describe 'Api::V2::MoviesController requests', type: :request do
  let!(:genres) { create_list(:genre, 5, :with_movies) }

  describe 'index' do
    before :each do
      visit '/api/v2/movies'
    end
    it 'responds with json' do
      expect(page.response_headers['content-type']).to include('application/json')
    end
    it 'displays titles' do
      expect(body).to include('title')
      expect(body).to include(Movie.all.sample.title)
    end
    it 'displays genre information' do
      expect(body).to include('genres')
      expect(body).to include(Movie.all.sample.genre.name)
    end
  end

  describe 'show' do
    before :each do
      visit "/api/v2/movies/#{Movie.first.id}"
    end
    it 'responds with json' do
      expect(page.response_headers['content-type']).to include('application/json')
    end
    it 'displays single movie' do
      expect(body).to include(Movie.first.title)
      expect(body).to include(Movie.first.genre.name)
    end
  end
end
