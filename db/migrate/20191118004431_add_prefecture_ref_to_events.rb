class AddPrefectureRefToEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :prefecture, foreign_key: true
  end
end
