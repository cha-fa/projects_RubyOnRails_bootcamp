class Order < ApplicationRecord

  has_many :join_table_order_items
  has_many :items, through: :join_table_order_items
  belongs_to :user
  after_create :empty_cart
  after_create :confirmation_email_admin
  after_create :confirmation_send_user

  
  def empty_cart
    @cart = self.user.cart
    @items_list = JoinItemCart.where(cart: @cart)
    @items_list.each do |object|
      a = JoinTableOrderItem.create(order: self, item_id: object.item_id)
    end

    @items_list.destroy_all
end


    
  def confirmation_email_admin
    @admins = User.where(is_admin: true)
    AdminMailer.confirmation_email_admin(@admins, self.user).deliver_now
  end

  def confirmation_send_user
    UserMailer.confirmation_email(self.user).deliver_now
  end

end
