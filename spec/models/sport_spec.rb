require "rails_helper"

RSpec.describe Sport, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end

  describe "relationships" do
    it { should have_many :events }
  end

  describe "instance methods" do
    describe "list_sport_events" do
      it "should return an array of all events for a sport" do
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

        output = {
          "sport": "Taekwondo",
          "events": [
            "t1","t2","t3"
          ]
        }

        expect(sport1.list_sport_events).to eq(output)
      end
    end
  end

  describe "class methods" do
    describe "self.list_all_with_events" do
      it "should return a list of all sports with events" do
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

        expect(Sport.list_all_with_events[:events].first[:sport]).to eq("Taekwondo")
        expect(Sport.list_all_with_events[:events].last[:sport]).to eq("Equestrianism")
        expect(Sport.list_all_with_events[:events].first[:events].count).to eq(3)
      end
    end
  end
end
