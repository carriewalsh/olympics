require "rails_helper"

RSpec.describe Olympian, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
  end

  describe "relationships" do
    it { should belong_to :team }
    it { should have_many :events }
  end

  describe "class methods" do
    before :all do
      Olympian.destroy_all
      Team.destroy_all
      @team = Team.create!(name: "USA")
      @o1 = @team.olympians.create(name: "Name 1", sex: "F", age: 18, weight: 80, height: 140)
      @o2 = @team.olympians.create(name: "Name 1", sex: "F", age: 36, weight: 100, height: 150)
      @o3 = @team.olympians.create(name: "Name 1", sex: "M", age: 20, weight: 100, height: 160)
      @o4 = @team.olympians.create(name: "Name 1", sex: "M", age: 30, weight: 120, height: 170)
    end
    describe "average_age" do
      it "should return the average age of all olympians" do
        expect(Olympian.average_age).to eq(26.0)
      end
    end

    describe "average_f_weight" do
      it "should return the average female weight" do
        expect(Olympian.average_f_weight).to eq(90.0)
      end
    end

    describe "average_m_weight" do
      it "should return the average male weight" do
        expect(Olympian.average_m_weight).to eq(110.0)
      end
    end

    describe "average_f_height" do
      it "should return the average female height" do
        expect(Olympian.average_f_height).to eq(145.0)
      end
    end

    describe "average_m_height" do
      it "should return the average male height" do
        expect(Olympian.average_m_height).to eq(155.0)
      end
    end

    describe "total_olympians" do
      it "should return the total count of olympians" do
        expect(Olympian.total_olympians).to eq(4)
      end
    end

    describe "stats" do
      it "should return the weight, age, and total stats for all olympians" do
        output = {
                    "olympian_stats": {
                      "total_competing_olympians": 4,
                      "average_weight": {
                        "unit": "kg",
                        "male_olympians": 110.0,
                        "female_olympians": 90.0
                      },
                      "average_height": {
                        "unit": "cm",
                        "male_olympians": 155.0,
                        "female_olympians": 145.0
                      },
                      "average_age": 26.0
                    }
                  }

        expect(Olympian.stats).to eq(output)
      end
    end
  end
end
