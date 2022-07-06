class CreateMaterials < ActiveRecord::Migration[6.1]
  def change
    create_table :materials do |t|
      t.integer :menu_id, null: false
      t.string :name, null: false
      t.string :weigh, null: false

      t.timestamps
    end
  end
end
