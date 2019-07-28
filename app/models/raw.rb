class Raw < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :team
  validates_presence_of :event
  validates_presence_of :sport
end
