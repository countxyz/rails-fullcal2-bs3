class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string   :title
      t.datetime :start
      t.datetime :finish
      t.text     :description
      t.timestamps
    end
  end
end
