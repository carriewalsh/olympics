class Olympian < ApplicationRecord
  validates_presence_of :name, :age

  belongs_to :team
  has_many :olympian_events
  has_many :events, through: :olympian_events


  def self.average_age
    Olympian.average(:age).round(1)
  end

  def self.average_f_weight
    Olympian.where(sex: "F").average(:weight).round(1)
  end

  def self.average_m_weight
    Olympian.where(sex: "M").average(:weight).round(1)

  end

  def self.average_f_height
    Olympian.where(sex: "F").average(:height).round(1)

  end

  def self.average_m_height
    Olympian.where(sex: "M").average(:height).round(1)

  end

  def self.total_olympians
    Olympian.count
  end

  def self.stats
    {
      "olympian_stats": {
        "total_competing_olympians": self.total_olympians,
        "average_weight": {
          "unit": "kg",
          "male_olympians": self.average_m_weight,
          "female_olympians": self.average_f_weight
        },
        "average_height": {
          "unit": "cm",
          "male_olympians": self.average_m_height,
          "female_olympians": self.average_f_height
        },
        "average_age": self.average_age
      }
    }
  end

  def sport
    events.first.sport.name
  end

  def medals_won
    olympian_events.where("medal_id IS NOT NULL").count
  end
end
