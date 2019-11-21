class AddEventIdToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :event_id, :integer
  end
end
