RSpec.describe Comment, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:movie) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:movie_id) }
    it 'validate scoped uniqueness of movie_id' do
      FactoryBot.create(:comment)
      is_expected.to validate_uniqueness_of(:movie_id).scoped_to(:user_id)
    end
  end

  describe 'db columns' do
    it { is_expected.to have_db_column(:id) }
    it { is_expected.to have_db_column(:user_id) }
    it { is_expected.to have_db_column(:movie_id) }
    it { is_expected.to have_db_column(:content) }
    it { is_expected.to have_db_column(:created_at) }
    it { is_expected.to have_db_column(:updated_at) }
  end

  describe "indices" do
    it { is_expected.to have_db_index(:user_id) }
    it { is_expected.to have_db_index(:movie_id) }
    it { is_expected.to have_db_index([:user_id, :movie_id]).unique }
  end
end
