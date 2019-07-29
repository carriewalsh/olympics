class Olympian < ApplicationRecord
  validates_presence_of :name, :age

  belongs_to :team
  has_many :olympian_events
  has_many :events, through: :olympian_events


  def self.average_age
    Olympian.average(:age)
  end

  def self.average_f_weight
    Olympian.where(sex: "F").average(:weight)
  end

  def self.average_m_weight
    Olympian.where(sex: "M").average(:weight)

  end

  def self.average_f_height
    Olympian.where(sex: "F").average(:height)

  end

  def self.average_m_height
    Olympian.where(sex: "M").average(:height)

  end

  def self.total_olympians
    Olympian.count
  end

  def self.stats
  end
end
