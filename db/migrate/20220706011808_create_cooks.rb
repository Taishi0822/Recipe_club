class CreateCooks < ActiveRecord::Migration[6.1]
  def change
    create_table :cooks do |t|
      t.integer :menu_id, null: false
      t.integer :cooks_count, null: false
      t.text :text, null: 

      t.timestamps
    end
  end
end
