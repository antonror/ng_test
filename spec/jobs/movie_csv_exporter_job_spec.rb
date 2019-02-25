RSpec.describe MovieCsvExporterJob, type: :job do
  let!(:genres) { create_list(:genre, 5, :with_movies) }
  let!(:user) { create(:user) }
  it 'enqueues job properly' do
    expect {
      described_class.perform_later(user.id)
    }.to have_enqueued_job(described_class)
  end

  it 'does not explode' do
    expect { described_class.perform_now(user.id) }.to_not raise_exception
    expect { described_class.perform_later(user.id) }.to_not raise_exception
  end
end
