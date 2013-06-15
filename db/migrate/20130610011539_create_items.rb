class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :brand
      t.integer :quantity
      t.string :unit
      t.text :note

      t.timestamps
    end
  end
end
