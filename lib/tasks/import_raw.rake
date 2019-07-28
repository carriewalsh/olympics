namespace :import do
  desc "rake import data from raw file"
  task raw: :environment do
    require "csv"
    CSV.foreach('db/data/raw_data.csv', headers: true) do |row|
      Raw.create(row.to_hash)
    end
  end
end
