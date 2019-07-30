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
end
