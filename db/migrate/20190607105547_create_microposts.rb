class CreateMicroposts < ActiveRecord::Migration[5.2]
  def change
    create_table :microposts do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :circle, foreign_key: true

      t.timestamps
    end
    add_index :microposts, [:circle_id, :user_id, :created_at]
  end
end
