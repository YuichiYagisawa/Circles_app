class CreateUserCircleRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :user_circle_relationships do |t|
      t.references :user, index: true, foreign_key: true
      t.references :circle, index: true, foreign_key: true
      t.integer :admin, default: 1

      t.timestamps
    end
    add_index :user_circle_relationships, :user_id
    add_index :user_circle_relationships, :circle_id
    add_index :user_circle_relationships, [:user_id, :circle_id], unique: true
  end
end
