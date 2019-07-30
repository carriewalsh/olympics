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

  def medalists
    medalist_ids = olympians.joins(:olympian_events).where("olympian_events.medal_id IS NOT NULL").pluck(:id)
    oes = OlympianEvent.where(id: medalist_ids).where("olympian_events.medal_id IS NOT NULL")
    summary = []
    medalists.each do |medalist|
      summary << medalist.olympian_events.medal_summary("event")
    end
  end
end
