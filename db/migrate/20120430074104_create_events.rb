class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :url
      t.text :description
      t.string :address
      t.float :lon
      t.float :lat
      t.date :started_at
      t.date :ended_at

      t.timestamps
    end
  end
end
