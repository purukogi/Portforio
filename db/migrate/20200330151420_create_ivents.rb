class CreateIvents < ActiveRecord::Migration[5.1]
  def change
    create_table :ivents do |t|
      t.string :name
      t.string :place
      t.datetime :iventday
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
