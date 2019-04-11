class CreateRentalHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :rental_histories do |t|
      t.references :user, foreign_key: true
      t.references :fixture, foreign_key: true
      t.datetime :returned_at
      t.text :note

      t.timestamps
    end
  end
end
