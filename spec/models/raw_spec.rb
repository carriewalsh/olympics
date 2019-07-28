require "rails_helper"

RSpec.describe Raw, type: :model do
  describe "validations" do
    it { should validate_presence_of :name}
    it { should validate_presence_of :team}
    it { should validate_presence_of :event}
    it { should validate_presence_of :sport}
  end
end
