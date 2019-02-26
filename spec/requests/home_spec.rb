require "rails_helper"

describe "Home requests", type: :request do
  describe "top commenters list" do
    it "displays right heading" do
      visit "/top-commenters"
      expect(page).to have_selector("h1", text: 'List of top commenters of the week')
    end
  end
  describe "welcome page" do
    it "displays right heading" do
      visit "/"
      expect(page).to have_selector("h1", text: 'Welcome to Pairguru App!')
    end
  end
end
