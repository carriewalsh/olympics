require "rails_helper"



describe "As a visitor" do
  describe "when I reach olympian_stats" do
    it "returns the stats for that game's olympians" do
      OlympianEvent.destroy_all
      Event.destroy_all
      Olympian.destroy_all
      Sport.destroy_all
      Medal.destroy_all
      Team.destroy_all
      @team = Team.create!(name: "USA")
      @o1 = @team.olympians.create(name: "Name 1", sex: "F", age: 18, weight: 80, height: 140)
      @o2 = @team.olympians.create(name: "Name 1", sex: "F", age: 36, weight: 100, height: 150)
      @o3 = @team.olympians.create(name: "Name 1", sex: "M", age: 20, weight: 100, height: 160)
      @o4 = @team.olympians.create(name: "Name 1", sex: "M", age: 30, weight: 120, height: 170)
      @sport = Sport.create(name: "Taekwondo")
      @event1 = @sport.events.create(name:"t1")
      @event2 = @sport.events.create(name:"t2")
      @event3 = @sport.events.create(name:"t3")
      @gold = Medal.create(name: "Gold", icon: "asdf")
      @silver = Medal.create(name: "Silver", icon: "asdf")
      @oe1 = OlympianEvent.create(olympian_id: @o1.id, event_id: @event1.id, medal_id: @gold.id)
      @oe2 = OlympianEvent.create(olympian_id: @o1.id, event_id: @event2.id, medal_id: @silver.id)
      @oe3 = OlympianEvent.create(olympian_id: @o1.id, event_id: @event3.id)
      @oe4 = OlympianEvent.create(olympian_id: @o2.id, event_id: @event3.id, medal_id: @silver.id)
      @oe5 = OlympianEvent.create(olympian_id: @o3.id, event_id: @event3.id, medal_id: @silver.id)
      @oe6 = OlympianEvent.create(olympian_id: @o4.id, event_id: @event3.id, medal_id: @silver.id)


      get "/api/v1/olympians"
      expect(response.status).to eq(200)

      body = JSON.parse(response.body, symbolize_names: true)

      expect(body[:olympians].count).to eq(4)
      expect(body[:olympians].first[:name]).to eq("Name 1")
      expect(body[:olympians].first[:team]).to eq("USA")
      expect(body[:olympians].first[:age]).to eq(18)
      expect(body[:olympians].first[:sport]).to eq("Taekwondo")
      expect(body[:olympians].first[:total_medals_won]).to eq(2)
    end
  end
end
