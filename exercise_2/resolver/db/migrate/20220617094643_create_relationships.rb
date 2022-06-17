class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.references :follower, null: false, index: true, foreign_key: { to_table: :users }
      t.references :following, null: false, index: true, foreign_key: { to_table: :users }

      t.index [:follower_id, :following_id], unique: true
      t.timestamps
    end
  end
end
