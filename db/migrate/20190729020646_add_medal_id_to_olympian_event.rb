class AddMedalIdToOlympianEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :olympian_events, :medal_id, :integer
  end
end
