class Event < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name

  belongs_to :sport
  has_many :olympian_events
  has_many :olympians, through: :olympian_events

  def medalists
    medalists = olympian_events.where("medal_id IS NOT NULL").order(:medal_id)
    ordered_medalists = medalists.map {|oe| oe.medal_summary("team")}
    {
      "event": self.name,
      "medalists": ordered_medalists
    }

  end

  def self.popularity
    by_id = OlympianEvent.select("event_id, count(event_id) AS count").group(:event_id).order("count":"desc")
    by_name = []
    by_id.map do |oe|
      output = {
        "event": Event.find(oe.event_id).name,
        "olympians":oe.count
      }
      by_name << output
    end
    {
      "popularity": by_name
    }
  end
end
