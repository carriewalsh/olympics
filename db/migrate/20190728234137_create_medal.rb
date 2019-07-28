class CreateMedal < ActiveRecord::Migration[5.2]
  def change
    create_table :medals do |t|
      t.string :name
      t.string :icon

      t.timestamps
    end
  end
end
