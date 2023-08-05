class CreateSpots < ActiveRecord::Migration[7.0]
  def change
    create_table :spots do |t|
      t.string :name
      t.integer :nearest_entry
      t.boolean :occupied, default: false
      t.references :parking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
