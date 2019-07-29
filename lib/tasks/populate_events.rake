namespace :populate do
  desc "rake populate events from raw and sports"
  task events: :environment do
    row = Raw.select("event","sport").distinct.order("event")
    row.each do |row|
      Sport.find_by(name: row.sport).events.create(name:row.event)
    end
  end
end
