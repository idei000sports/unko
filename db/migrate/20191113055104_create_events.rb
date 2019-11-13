class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :event_id
      t.string :event_title
      t.string :event_venue
      t.text :event_description
      t.integer :user_id
      t.datetime :start_date
      t.datetime :end_date
      t.integer :event_adv
      t.integer :event_door

      t.timestamps
    end
  end
end
