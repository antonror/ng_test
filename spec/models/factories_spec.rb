require "rails_helper"

describe FactoryGirl do
  it 'has all valid factories' do
    described_class.lint
  end
end