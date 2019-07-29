class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name, unique: true
      t.references :sport, foreign_key: true

      t.timestamps
    end
  end
end
