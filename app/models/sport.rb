class Sport < ApplicationRecord
  validates_uniqueness_of :name
  validates_presence_of :name

  has_many :events

  def list_sport_events
    list = events.map { |event| event.name }
    {"sport": self.name,
    "events": list}
  end

  def self.list_all_with_events
    sports_list = Sport.all.map do |sport|
      sport.list_sport_events
    end
    {
      "events": sports_list
    }
  end
end
