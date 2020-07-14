class AddGenreToVideos < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :genre_id, :integer
  end
end
