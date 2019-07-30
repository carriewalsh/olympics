require "rails_helper"

RSpec.describe Team, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end

  describe "relationships" do
    it { should have_many :olympians }
  end

  describe "class methods" do
    describe "olympians_list" do
      it "returns a list of all teams with olympians" do
        OlympianEvent.destroy_all
        Event.destroy_all
        Olympian.destroy_all
        Sport.destroy_all
        Medal.destroy_all
        Team.destroy_all
        team = Team.create(name: "USA")
        o1 = team.olympians.create(name: "Name 1", sex: "F", age: 18, weight: 80, height: 140)
        o2 = team.olympians.create(name: "Name 2", sex: "F", age: 18, weight: 80, height: 140)

        output = {
          "teams": [
            {
              "team": "USA",
              "olympians":
              [o1.name,o2.name]
            }
          ]
        }

        expect(Team.olympians_list).to eq(output)
      end
    end
  end

  describe "instance methods" do
    before :each do
      OlympianEvent.destroy_all
      Event.destroy_all
      Olympian.destroy_all
      Sport.destroy_all
      Medal.destroy_all
      Team.destroy_all
      @team = Team.create(name: "USA")
      @o1 = @team.olympians.create(name: "Name 1", sex: "F", age: 18, weight: 80, height: 140)
      @o2 = @team.olympians.create(name: "Name 2", sex: "F", age: 18, weight: 80, height: 140)
      @o3 = @team.olympians.create(name: "Name 3", sex: "F", age: 18, weight: 80, height: 140)
      @sport = Sport.create(name: "Taekwondo")
      @event1 = @sport.events.create(name:"t1")
      @gold = Medal.create(name: "Gold", icon: "asdf")
      @silver = Medal.create(name: "Silver", icon: "asdf")
      @oe1 = OlympianEvent.create(olympian_id: @o1.id, event_id: @event1.id, medal_id: @gold.id)
      @oe2 = OlympianEvent.create(olympian_id: @o2.id, event_id: @event1.id, medal_id: @silver.id)
      @oe3 = OlympianEvent.create(olympian_id: @o3.id, event_id: @event1.id)

    end
    describe "medalists" do
      xit "returns the medalist summaries for a team" do

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

        expect(@team.medalists[:medalists].first).to eq(output1)
        expect(@team.medalists[:medalists].last).to eq(output2)
      end
    end

    describe "total_event_count" do
      it "returns the count of events competed in by a country's olympians" do
        expect(@team.total_event_count).to eq(3)
      end
    end

    describe "medal_event_count" do
      it "returns the count of events medaled in by a country's olympians" do
        expect(@team.medal_event_count).to eq(2)
      end
    end

    describe "percentage_wins" do
      it "returns the count of events medaled in by a country's olympians" do
        expect(@team.medal_event_count).to eq(2)
      end
    end
  end
end
