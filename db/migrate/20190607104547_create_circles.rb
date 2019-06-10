class CreateCircles < ActiveRecord::Migration[5.2]
  def change
    create_table :circles do |t|
      t.string :circle_name
      t.string :circle_email
      t.text :circle_info

      t.timestamps
    end
  end
end
