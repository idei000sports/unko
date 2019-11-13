class CreateEventPerformers < ActiveRecord::Migration[5.2]
  def change
    create_table :event_performers do |t|
      t.integer :event_id
      t.string :performer_name

      t.timestamps
    end
  end
end
