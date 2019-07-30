class OlympianEvent < ApplicationRecord
  belongs_to :olympian
  belongs_to :event


  def medal_summary(return_val)
    medal = Medal.find(medal_id)
    if return_val == "team"
      {
        "name": olympian.name,
        "team": olympian.team.name,
        "age": olympian.age,
        "medal": medal.name,
        "medal_url": medal.icon
      }
    elsif return_val == "event"
      {
        "name": olympian.name,
        "age": olympian.age,
        "event": event.name,
        "medal": medal.name,
        "medal_url": medal.icon
      }
    end
  end
end
