describe "Movies requests", type: :request do
  let!(:genres) { create_list(:genre, 5, :with_movies) }

  describe "movies list" do
    it "displays title" do
      visit "/movies"
      expect(page).to have_selector("h1", text: "Movies")
    end
    it "displays movies" do
      visit "/movies"
      expect(page).to have_selector("table tr", count: 25)
    end
  end

  describe 'show' do
    it 'responds with 200' do
      Movie.all.sample.tap do |movie|
        visit "/movies/#{movie.id}"
        expect(page).to have_http_status(200)
        expect(page.body).to include(movie.pair_guru_movie_details.plot)
        expect(page).to have_selector('.panel-footer a', count: 0)
      end
    end
  end

  describe 'non CRUD actions' do
    let!(:user) { create :user }
    it 'requires authorization for send_info' do
      visit "/movies/#{Movie.all.sample.id}/send_info"
      expect(page).to have_http_status(200)
      expect(page).to have_selector('#flash_alert')
      expect(page).to have_current_path('/users/sign_in')
    end
    it 'completes successfuly for send_info' do
      sign_in user
      visit "/movies/#{Movie.all.sample.id}/send_info"
      expect(page).to have_http_status(200)
      expect(page).to have_selector('#flash_notice')
      expect(page).to have_current_path('/')
    end

    it 'requires authorization for export' do
      visit "/movies/export"
      expect(page).to have_http_status(200)
      expect(page).to have_selector('#flash_alert')
      expect(page).to have_current_path('/users/sign_in')
    end
    it 'completes successfuly for export' do
      sign_in user
      visit "/movies/export"
      expect(page).to have_http_status(200)
      expect(page).to have_selector('#flash_notice')
      expect(page).to have_current_path('/')
    end
  end
end
