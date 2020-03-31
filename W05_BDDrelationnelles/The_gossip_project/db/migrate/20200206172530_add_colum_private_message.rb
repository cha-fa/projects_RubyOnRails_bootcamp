class AddColumPrivateMessage < ActiveRecord::Migration[5.2]
  def change
    add_reference :private_messages, :join_message_recipient, foreign_key: true
  end
end
