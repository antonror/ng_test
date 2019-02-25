require 'rails_helper'

describe 'Api::V1::MoviesController requests', type: :request do
  let!(:genres) { create_list(:genre, 5, :with_movies) }

  describe 'index' do
    before :each do
      visit '/api/v1/movies'
    end
    it 'responds with json' do
      expect(page.response_headers['content-type']).to include('application/json')
    end
    it 'displays titles' do
      expect(body).to include('title')
      expect(body).to include(Movie.all.sample.title)
    end
    it 'doesnt display genre information' do
      expect(body).to_not include('genres')
      expect(body).to_not include(Movie.all.sample.genre.name)
    end
  end

  describe 'show' do
    before :each do
      visit "/api/v1/movies/#{Movie.first.id}"
    end
    it 'responds with json' do
      expect(page.response_headers['content-type']).to include('application/json')
    end
    it 'displays single movie' do
      expect(body).to include(Movie.first.title)
      expect(body).to_not include(Movie.first.genre.name)
    end
  end
end
