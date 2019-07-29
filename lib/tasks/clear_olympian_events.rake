namespace :clear do
  desc "rake clear olympian_events to repopulate"
  task olympian_events_winners: :environment do
    OlympianEvent.destroy_all
  end
end
