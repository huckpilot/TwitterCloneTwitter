class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :followed_id
      t.boolean :blocked

      t.timestamps null: false
    end
  end
end
