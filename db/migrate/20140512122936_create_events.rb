class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string   :name
      t.datetime :start,  default: Time.zone.now.beginning_of_day
      t.datetime :finish, default: Time.zone.now.end_of_day
      t.text     :description
      t.boolean  :all_day, default: false

      t.timestamps
    end
    add_index :events, :name, using: :btree
  end
end
