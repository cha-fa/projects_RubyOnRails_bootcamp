class AddUserToCart < ActiveRecord::Migration[5.2]
  def change
      change_table(:carts) do |t|
      t.references :user, index: true
    end

    remove_column :carts, :users_id
  end
end
