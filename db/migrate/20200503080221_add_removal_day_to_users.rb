class AddRemovalDayToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :removal_day, :date, default: DateTime.now
  end
end
