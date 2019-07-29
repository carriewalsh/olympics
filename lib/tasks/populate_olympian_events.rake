namespace :populate do
  desc "rake populate olympian_events from other tables"
  task olympian_events: :environment do
    medal_rows = Raw.where("medal IS NOT NULL")
    na_rows = Raw.where("medal IS NULL")
    medal_rows.each do |row|
      OlympianEvent.create(
        olympian_id: Olympian.where(name: row.name, age: row.age, height: row.height).first.id,
        event_id: Event.find_by(name: row.event).id,
        medal_id: Medal.find_by(name: row.medal).id)
    end

    na_rows.each do |row|
      OlympianEvent.create(
        olympian_id: Olympian.where(name: row.name, age: row.age, height: row.height).first.id,
        event_id: Event.find_by(name: row.event).id)
    end
  end
end
