class CreateFixtures < ActiveRecord::Migration[5.0]
  def change
    create_table :fixtures do |t|
      t.string :name
      t.text :type_number
      t.references :room, foreign_key: true
      t.text :note

      t.timestamps
    end
  end
end
