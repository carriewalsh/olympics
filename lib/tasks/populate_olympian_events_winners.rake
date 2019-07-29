namespace :populate do
  desc "rake populate olympian_events from other tables"
  task olympian_events_winners: :environment do
    medal_rows = Raw.where("medal IS NOT NULL")
    medal_rows.each do |row|
      OlympianEvent.create(
        olympian_id: Olympian.where(name: row.name, age: row.age, height: row.height).first.id,
        event_id: Event.find_by(name: row.event).id,
        medal_id: Medal.find_by(name: row.medal).id)
    end
  end
end
