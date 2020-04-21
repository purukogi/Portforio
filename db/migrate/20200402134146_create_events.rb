class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :eventname
      t.string :place
      t.date :eventday

      t.timestamps
    end
  end
end
