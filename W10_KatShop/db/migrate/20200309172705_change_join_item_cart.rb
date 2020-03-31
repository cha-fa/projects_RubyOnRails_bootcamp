class ChangeJoinItemCart < ActiveRecord::Migration[5.2]
  def change

    remove_column :join_item_carts, :carts_id
    remove_column :join_item_carts, :items_id

    add_reference :join_item_carts, :cart
    add_reference :join_item_carts, :item
  end
end
