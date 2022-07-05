class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.intrger :user_id, null: false
      t.intrger :genre_id, null: false
      t.string :name, null: false
      

      t.timestamps
    end
  end
end
