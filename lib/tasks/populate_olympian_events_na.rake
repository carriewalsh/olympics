namespace :populate do
  desc "rake populate olympian_events from other tables"
  task olympian_events_na: :environment do
    na_rows = Raw.where("medal IS NULL")

    na_rows.each do |row|
      OlympianEvent.create(
        olympian_id: Olympian.where(name: row.name, age: row.age, height: row.height).first.id,
        event_id: Event.find_by(name: row.event).id)
    end
  end
end
