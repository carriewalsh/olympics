require "rails_helper"

RSpec.describe "As a visitor" do
  describe "when I reach team/:id/medalists" do
    it "returns summaries of that teams medalists" do
      OlympianEvent.destroy_all
      Event.destroy_all
      Olympian.destroy_all
      Sport.destroy_all
      Medal.destroy_all
      Team.destroy_all
      team = Team.create(name: "USA")
      o1 = team.olympians.create(name: "Name 1", sex: "F", age: 18, weight: 80, height: 140)
      o2 = team.olympians.create(name: "Name 2", sex: "F", age: 18, weight: 80, height: 140)
      o3 = team.olympians.create(name: "Name 3", sex: "F", age: 18, weight: 80, height: 140)
      sport = Sport.create(name: "Taekwondo")
      event1 = sport.events.create(name:"t1")
      gold = Medal.create(name: "Gold", icon: "asdf")
      silver = Medal.create(name: "Silver", icon: "asdf")
      oe1 = OlympianEvent.create(olympian_id: o1.id, event_id: event1.id, medal_id: gold.id)
      oe2 = OlympianEvent.create(olympian_id: o2.id, event_id: event1.id, medal_id: silver.id)
      oe3 = OlympianEvent.create(olympian_id: o3.id, event_id: event1.id)

      get "/api/v1/teams/#{team.id}/medalists"
      expect(response.status).to eq(200)

      body = JSON.parse(response.body, symbolize_names: true)
      output1 = {
        "name": "Name 1",
        "age": 18,
        "event": "t1",
        "medal": "Gold"
      }
      output2 = {
        "name": "Name 2",
        "age": 18,
        "event": "t1",
        "medal": "Silver"
      }
      expect(body[:medalists].first).to eq(output1)
      expect(body[:medalists].last).to eq(output2)
    end
  end
end
