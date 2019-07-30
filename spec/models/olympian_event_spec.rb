require "rails_helper"

RSpec.describe OlympianEvent, type: :model do
  describe "relationships" do
    it { should belong_to :olympian }
    it { should belong_to :event }
  end

  describe "instance methods" do
    describe "medal_summary(return_val)" do
      it "returns the summary of a medalist with the team name or event name" do
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

        output1 = {
          "name": "Name 1",
          "team": "USA",
          "age": 18,
          "medal": "Gold"
        }
        output2 = {
          "name": "Name 1",
          "age": 18,
          "event": "t1",
          "medal": "Gold"
        }

        expect(oe1.medal_summary("team")).to eq(output1)
        expect(oe1.medal_summary("event")).to eq(output2)
      end
    end
  end
end
