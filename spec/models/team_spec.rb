require "rails_helper"

RSpec.describe Team, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end

  describe "relationships" do
    it { should belong_to have_many :olympians }
  end
end