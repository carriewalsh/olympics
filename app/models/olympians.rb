class Olympian < ApplicationRecord
  # validate_uniqueness_of :name
  validate_presence_of :name

  belongs_to :team
  has_many :olympian_events
  has_many :events, through: :olympian_events
end
