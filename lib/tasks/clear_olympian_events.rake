namespace :clear do
  desc "rake clear olympian_events to repopulate"
  task olympian_events: :environment do
    OlympianEvent.destroy_all
  end
end
