class CreateJoinItemCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :join_item_carts do |t|
      t.references :items
      t.references :carts
      t.timestamps
    end
  end
end
