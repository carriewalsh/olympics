namespace :populate do
  desc "rake populate olympians from raw uniquely"
  task olympians: :environment do
    rows = Raw.select("name","age","height","weight","team").distinct.order("name")
    rows.each do |row|
      Team.find_by(name: row.team).olympians.create(name: row.name, age: row.age, height: row.height, weight: row.weight)
    end
  end
end
