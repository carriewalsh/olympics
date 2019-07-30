require "rails_helper"

RSpec.describe Event, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end

  describe "relationships" do
    it { should belong_to :sport }
    it { should have_many :olympians }
  end

  describe "instance methods" do
    describe "medalists" do
      it "should return the medalist summaries for an event" do
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
        gold = Medal.create(name: "Gold", icon: "asdf")
        silver = Medal.create(name: "Silver", icon: "asdf")
        oe1 = OlympianEvent.create(olympian_id: o1.id, event_id: event1.id, medal_id: gold.id)
        oe2 = OlympianEvent.create(olympian_id: o2.id, event_id: event1.id, medal_id: silver.id)

        output1 = {
          "name": "Name 1",
          "team": "USA",
          "age": 18,
          "medal": "Gold"
        }
        output2 = {
          "name": "Name 2",
          "team": "USA",
          "age": 18,
          "medal": "Silver"
        }

        expect(event1.medalists[:medalists].first).to eq(output1)
        expect(event1.medalists[:medalists].last).to eq(output2)
      end
    end
  end
end
