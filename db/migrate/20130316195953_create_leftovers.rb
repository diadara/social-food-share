class CreateLeftovers < ActiveRecord::Migration
  def change
    create_table :leftovers do |t|
      t.string :name
      t.integer :serving_size
      t.datetime :expires_at
      t.integer :user_id

      t.timestamps
    end
  end
end
