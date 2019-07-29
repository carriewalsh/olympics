class Olympian < ApplicationRecord
  # validate_uniqueness_of :name
  validate_presence_of :name

  # belongs_to :team
  # has_many :events
end
