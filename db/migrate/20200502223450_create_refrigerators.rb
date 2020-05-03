class CreateRefrigerators < ActiveRecord::Migration[5.1]
  def change
    create_table :refrigerators do |t|
      t.string :name
      t.date :removal_day, default: DateTime.now
      t.date :expiration_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
