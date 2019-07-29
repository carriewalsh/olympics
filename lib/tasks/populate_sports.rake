namespace :populate do
  desc "rake populate sports from raw"
  task sports: :environment do
    sports = Raw.select("sport").distinct.pluck("sport").sort!
    sports.each do |sport|
      Sport.create!(name: sport)
    end
  end
end
