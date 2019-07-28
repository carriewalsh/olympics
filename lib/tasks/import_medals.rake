namespace :import do
  desc "rake import data from raw file"
  task medals: :environment do
    require "csv"
    CSV.foreach('db/data/medals.csv', headers: true) do |row|
      Medal.create(row.to_hash)
    end
  end
end
