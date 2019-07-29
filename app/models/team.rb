class Team < ApplicationRecord
  validate_uniqueness_of :name
  validate_presence_of :name

  has_many :olympians
end
