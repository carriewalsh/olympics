require "rails_helper"

RSpec.describe "As a visitor" do
  describe "when I reach '/popularity'" do
    it "shows me the events in order of most competitors" do
      OlympianEvent.destroy_all
      Event.destroy_all
      Olympian.destroy_all
      Sport.destroy_all
      Medal.destroy_all
      Team.destroy_all
      team = Team.create(name: "USA")
      o1 = team.olympians.create(name: "Name 1", sex: "F", age: 18, weight: 80, height: 140)
      o2 = team.olympians.create(name: "Name 2", sex: "F", age: 18, weight: 80, height: 140)
      sport = Sport.create(name: "Taekwondo")
      event1 = sport.events.create(name:"t1")
      event2 = sport.events.create(name:"t2")
      gold = Medal.create(name: "Gold", icon: "asdf")
      silver = Medal.create(name: "Silver", icon: "asdf")
      oe1 = OlympianEvent.create(olympian_id: o1.id, event_id: event1.id, medal_id: gold.id)
      oe2 = OlympianEvent.create(olympian_id: o2.id, event_id: event1.id, medal_id: silver.id)
      oe2 = OlympianEvent.create(olympian_id: o1.id, event_id: event2.id, medal_id: silver.id)

      output = {
        "popularity": [{
          "event": "t1",
          "olympians": 2
        },
        {
          "event": "t2",
          "olympians": 1
          }]
        }

      get "/api/v1/popularity"
      expect(response.status).to eq(200)

      body = JSON.parse(response.body, symbolize_names: true)

      expect(body).to eq(output)
    end
  end
end
