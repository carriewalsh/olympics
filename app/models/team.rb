class Team < ApplicationRecord
  validates_uniqueness_of :name
  validates_presence_of :name

  has_many :olympians

  def self.olympians_list
    teams = Team.all.map do |team|
      olys = team.olympians.map {|olympian| olympian.name}
      {
        "team": team.name,
        "olympians": olys
      }
    end
    {
      "teams": teams
    }
  end
end
