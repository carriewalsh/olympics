namespace :populate do
  desc "rake populate teams from raw"
  task teams: :environment do
    teams = Raw.select("team").distinct.pluck("team").sort!
    teams.each do |team|
      Team.create!(name: team)
    end
  end
end
