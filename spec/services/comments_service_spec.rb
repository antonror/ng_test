require "rails_helper"

describe CommentsService do

  describe "top commenters" do
    context 'when no users' do
      it 'returns empty array' do
        expect(described_class.top_commenters).to be_empty
      end
    end
    context 'when above 10 users' do
      it 'returns array of size 10' do
        movie1 = FactoryBot.create(:movie)
        movie2 = FactoryBot.create(:movie)

        5.times do |i|
          user = FactoryBot.create(:user)
          FactoryBot.create(:comment, user: user, movie: movie1)
          FactoryBot.create(:comment, user: user, movie: movie2)
        end

        # Ensure the worst_user is in the middle of default order (by created_at)
        worst_user = FactoryBot.create(:user)
        FactoryBot.create(:comment, user: worst_user, movie: movie1)

        5.times do |i|
          user = FactoryBot.create(:user)
          FactoryBot.create(:comment, user: user, movie: movie1)
          FactoryBot.create(:comment, user: user, movie: movie2)
        end

        result = described_class.top_commenters
        expect(result).not_to include(worst_user)
        expect(result.size).to eq(10)
      end
    end
  end
end
