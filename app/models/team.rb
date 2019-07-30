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

  def self.list_percentages
    teams = Team.all.map do |team|
      percent = team.percentage_wins
      {
        "team": team.name,
        "percentage_medals": percent
      }
    end
    {
      "teams": teams
    }
  end

  def medalists
    oe = []
    olys = olympians.joins(:olympian_events).where("olympian_events.medal_id IS NOT NULL")
    olys.each do |olympian|
      oe << olympian.olympian_events
    end
    oe.flatten!
    summary = {"medalists":[]}
    oe.each do |event|
      summary[:medalists] << event.medal_summary("event")
    end
    summary
  end

  def total_event_count
    olympians.joins(:events).count
  end

  def medal_event_count
    olympians.joins(:olympian_events).where("medal_id IS NOT NULL").count
  end

  def percentage_wins
    ((medal_event_count.to_f / total_event_count)*100).round(1)
  end
end
