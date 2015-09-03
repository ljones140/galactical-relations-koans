class CreateOrbitings < ActiveRecord::Migration
  def change
    create_table :orbitings do |t|
      t.references :planet, index: true, foreign_key: true
      t.references :asteroid, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
