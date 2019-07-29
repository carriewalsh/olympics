class Event < ApplicationRecord
  validate_presence_of :name
  validate_uniqueness_of :name

  belongs_to :sport
  # has_many :olympian_events
  # has_many :olympians, through: :olympian_events
end
