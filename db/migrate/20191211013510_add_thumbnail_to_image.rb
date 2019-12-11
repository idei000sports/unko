class AddThumbnailToImage < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :thumbnail, :boolean
  end
end
