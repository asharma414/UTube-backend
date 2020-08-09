class AddUploaderToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :uploader, :boolean, default: false
  end
end
