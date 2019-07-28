require "rails_helper"

RSpec.describe Medal, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :icon }
  end

  # describe "relationships" do
  #   it { should have_many :olympian_events }
  # end
end
