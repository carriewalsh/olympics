require "rails_helper"

RSpec.describe "As a visitor" do
  describe "when I visit '/teams'" do
    it "shows me all the teams and their athlete's names" do
      OlympianEvent.destroy_all
      Event.destroy_all
      Olympian.destroy_all
      Sport.destroy_all
      Medal.destroy_all
      Team.destroy_all
      team = Team.create(name: "USA")
      o1 = team.olympians.create(name: "Name 1", sex: "F", age: 18, weight: 80, height: 140)
      o2 = team.olympians.create(name: "Name 2", sex: "F", age: 18, weight: 80, height: 140)

      get "/api/v1/teams"
      expect(response.status).to eq(200)

      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:teams].first[:team]).to eq("USA")
      expect(body[:teams].first[:olympians].first).to eq("Name 1")
    end
  end
end
