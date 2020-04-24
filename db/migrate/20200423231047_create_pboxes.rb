class CreatePboxes < ActiveRecord::Migration[5.1]
  def change
    create_table :pboxes do |t|
      t.string :name

      t.timestamps
    end
  end
end
