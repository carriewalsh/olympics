require "rails_helper"

describe "As a visitor" do
  describe "when I reach events" do
    before :each do
      OlympianEvent.destroy_all
      Event.destroy_all
      Olympian.destroy_all
      Sport.destroy_all
      Medal.destroy_all
      Team.destroy_all
      @sport1 = Sport.create(name: "Taekwondo")
      @sport2 = Sport.create(name: "Equestrianism")
      @event1 = @sport1.events.create(name:"t1")
      @event2 = @sport1.events.create(name:"t2")
      @event3 = @sport1.events.create(name:"t3")
      @event4 = @sport2.events.create(name:"e1")
      @event5 = @sport2.events.create(name:"e2")
      @event6 = @sport2.events.create(name:"e3")
    end

    it "returns the stats for that game's olympians" do
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
end
