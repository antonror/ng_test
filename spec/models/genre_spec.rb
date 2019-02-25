require "rails_helper"

describe Genre do
  let!(:genre) { create(:genre, :with_movies) }
  it 'has working counter_cache: movies_count' do
    expect(genre.movies.count).to_not eq(0)
    expect(genre.movies_count).to_not eq(0)

    expect(genre.movies.count).to eq(genre.movies_count)
  end
end
