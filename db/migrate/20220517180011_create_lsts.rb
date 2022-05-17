class CreateLsts < ActiveRecord::Migration[7.0]
  def change
    create_table :lsts do |t|
      t.string :title
      t.string :spotify_id

      t.timestamps
    end
  end
end
