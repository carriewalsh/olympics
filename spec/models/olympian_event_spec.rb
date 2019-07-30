require "rails_helper"

RSpec.describe OlympianEvent, type: :model do
  describe "relationships" do
    it { should belong_to :olympian }
    it { should belong_to :event }
  end

  describe "instance methods" do
    describe "summary" do
      it "returns the summary of a medalist" do
        OlympianEvent.destroy_all
        Event.destroy_all
        Olympian.destroy_all
        Sport.destroy_all
        Medal.destroy_all
        Team.destroy_all
        team = Team.create(name: "USA")
        o1 = team.olympians.create(name: "Name 1", sex: "F", age: 18, weight: 80, height: 140)
        sport = Sport.create(name: "Taekwondo")
        event1 = sport.events.create(name:"t1")
        gold = Medal.create(name: "Gold", icon: "asdf")
        oe1 = OlympianEvent.create(olympian_id: o1.id, event_id: event1.id, medal_id: gold.id)

        output = {
          "name": "Name 1",
          "team": "USA",
          "age": 18,
          "medal": "Gold"
        }

        expect(oe1.summary).to eq(output)
      end
    end
  end
end
