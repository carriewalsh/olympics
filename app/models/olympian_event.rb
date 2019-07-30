class OlympianEvent < ApplicationRecord
  belongs_to :olympian
  belongs_to :event


  def medal_summary
    medal = Medal.find(medal_id)
    {
      "name": olympian.name,
      "team": olympian.team.name,
      "age": olympian.age,
      "medal": medal.name
    }
  end
end
