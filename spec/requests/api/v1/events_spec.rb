require "rails_helper"

describe "As a visitor" do
  describe "when I reach events" do

    it "returns the all the events for each sport" do
      OlympianEvent.destroy_all
      Event.destroy_all
      Olympian.destroy_all
      Sport.destroy_all
      Medal.destroy_all
      Team.destroy_all
      sport1 = Sport.create(name: "Taekwondo")
      sport2 = Sport.create(name: "Equestrianism")
      event1 = sport1.events.create(name:"t1")
      event2 = sport1.events.create(name:"t2")
      event3 = sport1.events.create(name:"t3")
      event4 = sport2.events.create(name:"e1")
      event5 = sport2.events.create(name:"e2")
      event6 = sport2.events.create(name:"e3")

      output1 = {
        "sport": "Taekwondo",
        "events": [
          "t1",
          "t2",
          "t3"
        ]
      }
      output2 = {
        "sport": "Equestrianism",
        "events": [
          "e1",
          "e2",
          "e3"
        ]
      }

      get "/api/v1/events"
      expect(response.status).to eq(200)

      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:events].first).to eq(output1)
      expect(body[:events].last).to eq(output2)
    end
  end

  describe "when I reach events/:id" do
    it "returns the events for a specific sport" do
      OlympianEvent.destroy_all
      Event.destroy_all
      Olympian.destroy_all
      Sport.destroy_all
      Medal.destroy_all
      Team.destroy_all
      sport1 = Sport.create(name: "Taekwondo")
      event1 = sport1.events.create(name:"t1")
      event2 = sport1.events.create(name:"t2")
      event3 = sport1.events.create(name:"t3")

      output = [
          "t1",
          "t2",
          "t3"
        ]

      get "/api/v1/events/#{sport1.id}"
      expect(response.status).to eq(200)
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:events]).to eq(output)
    end
  end
end
