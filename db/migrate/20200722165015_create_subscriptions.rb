class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.integer :subscriber_id
      t.integer :subscribee_id

      t.timestamps
    end
  end
end
